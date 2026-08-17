show tables;

select * from users;
select * from Playlists;
select * from Tracks;
select * from PlaylistTracks;

#1 Find all the distinct album names.

	select distinct(t.album_name)
	from Tracks t ;

#2 Who is the artist of song 'Never Seen the Rain'?
	
	select t.artist_name  
	from Tracks t 
	where t.track_name = "Never Seen the Rain";

# Q:3 Name all the user & email, who have registered with gmail id.
	
	SELECT u.username , Email 
	FROM Users u
	WHERE Email LIKE '%@gmail.com';

# Q:4 List the name of users along with registration dates, who have registered after April-22.
	
	select u.username , u.registration_date
	from Users u
	where u.registration_date > '2022-04-30';

# Q:5 Extract the name of tracks, artists, albums and release dates for tracks released in year 2017
	
	select t.track_name , t.artist_name , t.album_name , t.release_date 
	from Tracks t 
	where year(t.release_date) = '2017' 

# Q:6 Find the details of the users who have registed in between may and august.
	
	select *
	from Users u 
	where MONTH(u.registration_date) < '09' and MONTH(u.registration_date) > '04';


# Q:7 Count the number of playlists created by each user.
select u.user_id ,u.username , count(*)
from Users u inner join Playlists p 
on u.user_id = p.user_id 
group by u.user_id ,u.username;

# Q:8 Find the track names and their durations for a specific album in the Tracks table.
select album_name, track_name, duration
from Tracks
where album_name = 'After Hours';

# Q:9 Calculate the average duration of tracks in the Tracks table.
	
	select AVG(t.duration) "Avg. Duration"
	from Tracks t;

# Q:10 How many users have registered with yahoo.com id?
SELECT u.username , Email 
FROM Users u
WHERE Email LIKE '%@yahoo.com';

# Q:11 Find the playlist names and the number of tracks in each playlist created by users whose email addresses end with '@gmail.com'.
select p.playlist_name,
       count(distinct pt.track_id) as track_count
from Playlists p
inner join Users u
    on p.user_id = u.user_id
inner join PlaylistTracks pt
    on p.playlist_id = pt.playlist_id
where u.email like '%@gmail.com'
group by p.playlist_name;

# Q:12 Write a query to retrieve the usernames and email addresses of users who have created playlists with more than 5 tracks and an average track duration greater than 200 seconds.
select u.UserName, 
	   u.Email , 
	   count(distinct(t.Track_ID)) "No. of tracks", 
	   avg(t.Duration) "Avg duration"
from Users u 
inner join Playlists p 
on u.User_ID = p.User_ID
inner join PlaylistTracks pt 
on p.Playlist_ID = pt.Playlist_ID
inner join Tracks t 
on pt.Track_ID = t.Track_ID
group by u.UserName, u.Email, p.Playlist_ID 
having count(distinct(t.Track_ID)) > 5 and avg(t.Duration) > 200;

# Q:13 Find the track and artist names of the tracks that have a duration greater than the average duration of all tracks in the 'Tracks' table.	
	
select track_name , artist_name , duration 
from Tracks  
where duration >(
	select avg(duration)
	from Tracks 
);

# Q:14 Find the users who have created playlists with tracks from all albums released in a specific year.
select u.UserName 
from users u
inner join Playlists p 
on u.user_id  = p.user_id 
inner join PlaylistTracks pt 
on p.playlist_id  = pt.playlist_id 
inner join Tracks t 
on pt.track_id = t.track_id 
where year(t.release_date)  = 2017
group by u.username
having count(distinct album_name) = (
   select count(distinct album_name)
   from Tracks
   where year(release_date) = 2017
);

# Q:15 Name of playlist and their total durations, sorted by the number of tracks in descending order.
select 
    p.playlist_name,
    sum(t.duration) as total_duration,
    count(pt.track_id) as total_tracks
from playlists p
join playlisttracks pt 
on p.playlist_id = pt.playlist_id
join tracks t 
on pt.track_id = t.track_id
group by p.playlist_id, p.playlist_name
order by total_tracks desc;

# Q:16 Find the playlists that have tracks with a duration longer than the average duration of all tracks.
select distinct(p.playlist_name)
from tracks t 
inner join playlisttracks pt 
on t.track_id = pt.track_id
inner join playlists p 
on p.playlist_id = pt.playlist_id
where duration >(
	select avg(t.duration)
	from tracks t
)
order by p.playlist_name ; 


# Q:17 Find the top 3 playlists with the most tracks.
select p.playlist_name, count(*) "No. of tracks"
from Playlists p 
inner join PlaylistTracks pt
on p.playlist_id = pt.playlist_id 
group by p.playlist_name 
order by count(*) desc
limit 3;

# Q:18 Calculate the average track duration for each user and display the results in descending order.
select u.username , round(avg(t.duration)) "Avg_Duration"
from Users u 
inner join Playlists p 
on u.User_ID = p.User_ID
inner join PlaylistTracks pt 
on p.Playlist_ID = pt.Playlist_ID
inner join Tracks t 
on pt.Track_ID = t.Track_ID
group by u.username 
order by round(avg(t.duration)) desc;

# Q:19 Find the track names and artist names of the tracks that are included in at least two different playlists.
# Show the songs that appear in two or more playlists.
select t.track_name , 
	   t.artist_name , 
	   count(distinct(pt.playlist_id)) "No. of Playlists"
from Tracks t 
inner join PlaylistTracks pt 
on pt.track_id = t.track_id
group by t.track_name , t.artist_name
having count(distinct(pt.playlist_id)) >= 2
order by count(distinct(pt.playlist_id)) desc;

# Q:20 Find the playlist names and the total duration of each playlist. Include only the playlists created
#	   by users who registered in the year 2022.
select u.username Username,
       p.playlist_name Playlist_Names,
       sum(t.duration) Total_Duration
from Users u 
inner join playlists p 
on u.user_id = p.user_id 
inner join playlisttracks pt
on p.playlist_id = pt.playlist_id 
inner join tracks t
on pt.track_id = t.track_id
where year(u.registration_date) = 2022 
group by u.username, p.playlist_name;

# Q:21 Find the track names and artist names of the tracks that are included in playlists created
#	   by users who registered before the average registration date of all users.
	
select distinct t.track_name Tracks,
       t.artist_name Artists,
       p.playlist_name PLaylist_Names,
       u.registration_date Registration_Dates
from users u
inner join playlists p 
on u.user_id = p.user_id 
inner join playlisttracks pt
on p.playlist_id = pt.playlist_id 
inner join tracks t 
on t.track_id = pt.track_id 
where u.registration_date < (
    select avg(registration_date )
    from users
);

# Q:22 Use subquery to retrieve the names of users who have created playlists containing tracks from
#	   both the album 'After Hours' by The Weeknd and the album 'When We All Fall Asleep, Where Do We Go?'
#	   by Billie Eilish.
	
select u.username
from Users u
join Playlists p 
    on u.user_id = p.user_id
join PlaylistTracks pt
    on p.playlist_id = pt.playlist_id
join Tracks t
    on pt.track_id = t.track_id
where t.album_name in (
    'After Hours',
    'When We All Fall Asleep, Where Do We Go'
)
group by u.username
having count(distinct t.album_name) = 2;

# Q:23 Write a SQL query to extract the name of top 3 users with the highest average track duration
#	   for their playlists.
select u.username , 
	   avg (t.duration ) "Avg. Duration"
from Users u 
inner join Playlists p 
on u.User_ID = p.User_ID
inner join PlaylistTracks pt 
on p.Playlist_ID = pt.Playlist_ID
inner join Tracks t 
on pt.Track_ID = t.Track_ID
group by u.username 
order by `Avg. Duration` desc
limit 3;

# Q:24 Find the tracks that have a duration greater than the average duration of all tracks and rank
#	   them within their respective albums.
SELECT
    track_name,
    duration,
    album_name,
    DENSE_RANK() OVER (
        PARTITION BY album_name
        ORDER BY duration DESC
    ) AS rank_in_album
FROM Tracks
WHERE duration > (
    SELECT AVG(duration)
    FROM Tracks
);

# Q:25 Name the playlists along with the total number of tracks and the rank of the playlist based 
#	   on the number of tracks.
select p.playlist_name "Playlist",
	   count(pt.track_id) "No. of Track",
	   row_number() over (
		   order by count(pt.track_id) desc
	   ) as "Rank by Track Count"	
from Users u 
inner join Playlists p 
on u.User_ID = p.User_ID
inner join PlaylistTracks pt 
on p.Playlist_ID = pt.Playlist_ID
inner join Tracks t 
on pt.Track_ID = t.Track_ID
group by p.playlist_name
order by `Rank by track count`, p.playlist_name desc ;

# Q:26 Find the users who have created playlists with the highest number of tracks from a specific artist.
SELECT 
    u.username,
    COUNT(pt.track_id) AS "No. of tracks"
FROM Users u
INNER JOIN Playlists p
ON u.user_id = p.user_id
INNER JOIN PlaylistTracks pt
ON p.playlist_id = pt.playlist_id
INNER JOIN Tracks t
ON pt.track_id = t.track_id
WHERE t.artist_name = 'The Weeknd'
GROUP BY u.username
ORDER BY COUNT(pt.track_id) DESC;


# Q:27 Write a SQL query to retrieve the topmost users who have created playlists with the highest number
#	   of unique tracks from a specific artist.
SELECT 
    u.username,
    COUNT(DISTINCT pt.track_id) AS "No. of tracks by Billie Eilish"
FROM Users u
INNER JOIN Playlists p 
ON u.user_id = p.user_id
INNER JOIN PlaylistTracks pt 
ON p.playlist_id = pt.playlist_id
INNER JOIN Tracks t 
ON pt.track_id = t.track_id
WHERE t.artist_name = 'Billie Eilish'
GROUP BY u.username
ORDER BY COUNT(DISTINCT pt.track_id) DESC
LIMIT 2;



# Q:28 Find the tracks that have a duration greater than the average duration of all tracks in their
#	   respective albums.
SELECT 
    t.track_id,
    t.track_name,
    t.duration,
    t.album_name
FROM Tracks t
WHERE t.duration >
(
    SELECT AVG(t2.duration)
    FROM Tracks t2
    WHERE t2.album_name = t.album_name
);

	
# Q:29 Find name of the playlists along with the user who created them, sorted by the number of tracks
#	   in descending order and the username in ascending order
select p.playlist_name,
    	   u.UserName,
    	   count(pt.Track_ID) AS track_count
from Playlists p
inner join Users u 
on p.User_ID = u.User_ID
inner join PlaylistTracks pt 
on p.Playlist_ID = pt.Playlist_ID
group by p.Playlist_Name,
    		 u.UserName
order by track_count DESC,u.UserName ASC;


# Q:30 Write a SQL query to retrieve the playlists along with the user who created them, and the position
#	   of the track with the longest duration within each playlist.
select p.Playlist_Name,
    	   u.UserName,
    	   pt.Track_ID,
    	   t.Track_Name,
    	   pt.Position  "longest track position"
from Playlists p
inner join Users u 
on p.User_ID = u.User_ID
inner join PlaylistTracks pt 
on p.Playlist_ID = pt.Playlist_ID
inner join Tracks t 
on pt.Track_ID = t.Track_ID
where (p.Playlist_ID, t.Duration) in 
(
	  select pt2.Playlist_ID,
	         max(t2.Duration) "Max. Duration"
	  from PlaylistTracks pt2
	  inner join Tracks t2 
	  on pt2.Track_ID = t2.Track_ID
	  group by pt2.Playlist_ID
);
