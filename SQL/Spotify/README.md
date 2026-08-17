# Spotify Music Database Project

## Overview
This SQL project contains a comprehensive music streaming database for Spotify. The project includes user accounts, playlists, track information, and relationships between users and their music preferences.

## Database Structure

### Tables

#### 1. **Users**
Contains Spotify user account information.

**Columns:**
- `user_id` - Unique user identifier
- `username` - User's display name
- `email` - User email address
- `registration_date` - Account creation date
- Additional user profile information

**Sample Users:**
- Users from multiple regions
- Registration dates spanning multiple years
- Diverse email providers (Gmail, etc.)

#### 2. **Playlists**
Contains playlist information and ownership.

**Columns:**
- `playlist_id` - Unique playlist identifier
- `user_id` - Playlist creator/owner
- `playlist_name` - Name of the playlist
- `creation_date` - Date playlist was created
- `description` - Playlist description
- Additional playlist metadata

#### 3. **Tracks**
Contains music track and artist information.

**Columns:**
- `track_id` - Unique track identifier
- `track_name` - Name of the song
- `artist_name` - Name of the artist
- `album_name` - Album containing the track
- `release_date` - Date track was released
- `duration` - Track duration in seconds
- `genre` - Music genre classification
- Additional track metadata

#### 4. **PlaylistTracks**
Junction table linking playlists and tracks (many-to-many relationship).

**Columns:**
- `playlist_id` - Reference to playlist
- `track_id` - Reference to track
- `position` - Order of track in playlist
- `added_date` - When track was added to playlist

## Data Files
- `spotify_script.sql` - SQL script with database creation and analysis queries
- Complete schema with sample data

## Key Queries Included

### 1. **Album & Artist Discovery**
- Find all distinct album names
- Find artist of specific songs
- Show all tracks by specific artist
- List albums by genre

### 2. **User Analysis**
- Find users by email provider (Gmail, Yahoo, etc.)
- Users registered within date ranges
- Users registered in specific months
- Active users by registration period

### 3. **Track Information**
- Extract tracks by release year
- Songs by specific artist
- Tracks in specific album
- Track information with artist and album details

### 4. **Playlist Analysis**
- Count playlists created by each user
- Most popular playlists
- Tracks in specific playlist
- Playlist creation patterns

### 5. **User Engagement**
- User playlist creation statistics
- Most active playlist creators
- Track addition patterns
- User music preferences

## Business Insights

### User Base
- **Global Distribution**: Users from multiple countries
- **Email Diversity**: Various email providers (Gmail dominance, etc.)
- **Seasonal Registration**: Peak registration periods
- **Retention**: Long-term vs new users

### Playlist Characteristics
- **User-Generated Playlists**: Music curation by users
- **Collaborative Potential**: Shared playlists among friends
- **Genre-Based**: Organized by music type
- **Mood-Based**: Contextual playlists (workout, study, party, etc.)

### Music Catalog
- **Diverse Artists**: Multiple genres and styles
- **Historical Depth**: Tracks from various years
- **Album Coverage**: Complete album information
- **Genre Distribution**: Various music genres represented

### Engagement Patterns
- **Playlist Creation**: Active user base creating curated content
- **Track Addition**: Users constantly updating playlists
- **Discovery**: Users exploring new music
- **Sharing**: Potential for social engagement

## Use Cases

1. **User Analytics** - Understand user registration and engagement patterns
2. **Music Discovery** - Recommend tracks based on preferences
3. **Playlist Curation** - Suggest playlists based on taste
4. **Marketing Segmentation** - Target users by registration period or preferences
5. **Content Analysis** - Analyze music catalog and artist performance
6. **Social Features** - Build collaborative playlists
7. **Personalization** - Customize user experience
8. **Trend Analysis** - Identify popular artists and genres

## Sample Analytics

### Queries to Try
- **All distinct albums:**
```sql
SELECT DISTINCT album_name
FROM Tracks
ORDER BY album_name;
```

- **Find artist of specific song:**
```sql
SELECT artist_name
FROM Tracks
WHERE track_name = 'Never Seen the Rain';
```

- **Users with Gmail addresses:**
```sql
SELECT username, email
FROM Users
WHERE email LIKE '%@gmail.com'
ORDER BY username;
```

- **Users registered after April 2022:**
```sql
SELECT username, registration_date
FROM Users
WHERE registration_date > '2022-04-30'
ORDER BY registration_date DESC;
```

- **Tracks released in 2017:**
```sql
SELECT track_name, artist_name, album_name, release_date
FROM Tracks
WHERE YEAR(release_date) = 2017
ORDER BY track_name;
```

- **Users registered between May and August:**
```sql
SELECT username, registration_date
FROM Users
WHERE MONTH(registration_date) BETWEEN 5 AND 8
ORDER BY registration_date;
```

- **Playlist count by user:**
```sql
SELECT u.user_id, u.username, COUNT(p.playlist_id) as playlist_count
FROM Users u
LEFT JOIN Playlists p ON u.user_id = p.user_id
GROUP BY u.user_id, u.username
ORDER BY playlist_count DESC;
```

- **Tracks in specific album:**
```sql
SELECT track_name, artist_name, duration, release_date
FROM Tracks
WHERE album_name = 'Album Name Here'
ORDER BY release_date;
```

- **User's playlists and track count:**
```sql
SELECT p.playlist_name, COUNT(pt.track_id) as track_count
FROM Playlists p
LEFT JOIN PlaylistTracks pt ON p.playlist_id = pt.playlist_id
WHERE p.user_id = 'specific_user_id'
GROUP BY p.playlist_id, p.playlist_name;
```

- **Most followed playlists (by track count):**
```sql
SELECT p.playlist_name, u.username, COUNT(pt.track_id) as track_count
FROM Playlists p
JOIN Users u ON p.user_id = u.user_id
LEFT JOIN PlaylistTracks pt ON p.playlist_id = pt.playlist_id
GROUP BY p.playlist_id, p.playlist_name, u.username
ORDER BY track_count DESC
LIMIT 10;
```

- **Genre distribution:**
```sql
SELECT genre, COUNT(*) as track_count
FROM Tracks
WHERE genre IS NOT NULL
GROUP BY genre
ORDER BY track_count DESC;
```

- **Top artists by track count:**
```sql
SELECT artist_name, COUNT(*) as track_count
FROM Tracks
GROUP BY artist_name
ORDER BY track_count DESC
LIMIT 10;
```

## User Behavior Metrics

### Key Indicators
- **Playlist Diversity**: Number and variety of playlists created
- **Music Preference**: Genre and artist choices
- **Engagement Level**: Active playlist management
- **Discovery Behavior**: Addition of new tracks
- **Social Patterns**: Playlist sharing and collaboration

## Database Statistics

### Catalog Size
- **Users**: Multiple registered users
- **Playlists**: User-generated playlist collection
- **Tracks**: Thousands of music tracks
- **Artists**: Hundreds of unique artists
- **Albums**: Complete album coverage

### Temporal Distribution
- **Registration Dates**: Multi-year span
- **Release Dates**: Historical music catalog
- **Track Duration**: Varies by genre

## Prerequisites
- MySQL or compatible SQL database
- CSV import capability
- SQL proficiency
- Music streaming knowledge

## Setup Instructions
1. Create the Spotify database
2. Execute the SQL script to create tables
3. Establish relationships between tables
4. Insert track and user data
5. Run analysis queries

## Data Relationships

### Entity Relationships
- **Users → Playlists**: One-to-Many (user creates multiple playlists)
- **Playlists ↔ Tracks**: Many-to-Many (via PlaylistTracks)
- **Tracks**: Contains artist and album information
- **PlaylistTracks**: Maintains track order in playlist

## Extension Possibilities
- Add user ratings/reviews
- Track listening history
- Implement recommendation engine
- Add follow/friendship relationships
- Manage podcast content
- Track download history
- Implement user preferences

## Advanced Features
- Personalized recommendations
- Trend analysis over time
- Collaborative filtering
- Content-based recommendations
- Social network analysis
- Music consumption patterns

---

**Last Updated**: August 2026  
**Database Type**: MySQL  
**Platform**: Spotify Music Streaming  
**Focus**: User Playlists and Music Discovery
