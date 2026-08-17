create database sky_sports;

use sky_sports;

show tables;

select * from group_stage_team_stats gsts;
select * from overall_wc_stats ows;

#2. Write an sql query to show all the UNIQUE team names
select distinct team
from group_stage_team_stats gsts;

#3. Write an SQL query to show name of team which has rank 1 from group 7
select team 
from group_stage_team_stats gsts 
where gsts.`rank` = 1
and gsts.`group` = 7;

#4. Write an sql query to show count of all teams
select count(*) 
from group_stage_team_stats gsts;

#5.Write an SQL query to show matches_played by each team
select team,
       matches_played
from group_stage_team_stats gsts;

#6. Write an SQL query to show team, percent of wins with respect to matches_played by each team and name the resulting column as wins_percent
select team,
      round((wins * 100.0)/matches_played,2) as wins_percent
from group_stage_team_stats gsts;

#7. Write an SQL query to show which team has maximum goals_scored and their count
select team,
       goals_scored
from group_stage_team_stats gsts 
order by goals_scored desc
limit 1;

#8.  Write an SQL query to show percent of draws with respect to matches_played round of to 2 digits by each team
select team,
       round((draws * 100.0)/matches_played, 2) as draws_percent
from group_stage_team_stats gsts;

#9. Write an SQL query to show which team has minimum goals_scored and their count
select team,
       goals_scored
from group_stage_team_stats gsts 
order by goals_scored 
limit 1;

#10.  Write an SQL query to show percent of losses with respect to matches_played by each team in ascending order by losses and name the resulting column as losses_percent
select team,
      round((losses * 100.0)/matches_played,2) as losses_percent
from group_stage_team_stats gsts
order by losses_percent;

#11. Write an SQL query to show the average goal_difference
select avg(goal_difference)
from group_stage_team_stats gsts;

#12.  Write an SQL query to show name of the team where points are 0
select team,
       points
from group_stage_team_stats gsts 
where points = 0;

#13.  Write an SQL query to show name of the team where points are 0
select * from group_stage_team_stats gsts 
where gsts.expected_goal_scored < gsts.exp_goal_conceded;

#14. Write an SQL query to show data where exp_goal_difference is in between -0.5 and 0.5
select * from group_stage_team_stats gsts 
where gsts.exp_goal_difference between -0.5 and 0.5;

#15. Write an SQL query to show all data in ascending order by exp_goal_difference_per_90
select * from group_stage_team_stats gsts 
order by gsts.exp_goal_difference_per_90;

#16. Write an SQL query to show team which has maximum number of players_used
select team, 
       players_used
from overall_wc_stats ows 
order by ows.players_used desc 
limit 1;

#17. Write an SQL query to show each team name and avg_age in ascending order by avg_age
select team, 
       avg_age
from overall_wc_stats ows 
order by avg_age asc;

#18. Write an sql query to show average possession of teams
select avg(possession)
from overall_wc_stats ows;

#19. Write a SQL query to show team which has played atleast 5 games
select team
from overall_wc_stats ows 
where ows.games >=5 ;

#20. Write an SQL query to show all data for which minutes is greater than 600
select * from overall_wc_stats ows 
where ows.minutes > 600;

#21. Write an SQL query to show team, goals, assists in ascending order by goals
 select team,
        goals,
        assists
from overall_wc_stats ows 
order by goals;

#22. Write an SQL query to show team, pens_made, pens_att in descending order by pens_made
select team, 
       pens_made, 
       pens_att
from overall_wc_stats ows 
order by ows.pens_made desc;

#23. Write an SQL query to show team, cards_yellow, cards_red where cards_red is equal to 1 in ascending order by cards_yellow
select team, 
       cards_yellow,
       cards_red
from overall_wc_stats ows 
where ows.cards_red = 1
order by cards_yellow;

#24. Write an SQL query to show team, goals_per90, assists_per90, goals_assists_per90 in descending order by goals_assists_per90
select team, 
       goals_per90,
       assists_per90,
       goals_assists_per90
from overall_wc_stats ows 
order by goals_assists_per90 desc;

#25. Write an SQL query to show team, goals_pens_per90, goals_assists_pens_per90 in ascending order by goals_assists_pens_per90
select team, 
       goals_per90,
       assists_per90,
       goals_assists_per90
from overall_wc_stats ows 
order by goals_assists_per90;

#26. Write an SQL query to show team, shots, shots_on_target, shots_on_target_pct where shots_on_target_pct is less than 30 in ascending order by shots_on_target_pct
select team,
       shots,
       shots_on_target,
       shots_on_target_pct
from overall_wc_stats ows 
where ows.shots_on_target_pct < 30 
order by ows.shots_on_target_pct;

#27. Write an SQL query to show team, shots_per90, shots_on_target_per90 for team Belgium
select team,
       shots_per90,
       shots_on_target_per90
from overall_wc_stats ows 
where team = 'Belgium';

#28. Write an SQL query to show team, goals_per_shot, goals_per_shot_on_target, average_shot_distance in descending order by average_shot_distance
select team,
       goals_per_shot,
       goals_per_shot_on_target,
       average_shot_distance
from overall_wc_stats ows 
order by average_shot_distance desc;

#29. Write an SQL query to show team, errors, touches for which errors is 0 and touches is less than 1500
select team, 
       errors,
       touches 
from overall_wc_stats ows 
where ows.errors = 0 and ows.touches < 1500;

#30. Write an SQL query to show team, fouls which has maximum number of fouls
select team,
       fouls
from overall_wc_stats ows 
order by fouls desc
limit 1;

#31. Write an SQL query to show team, offisdes which has offsides less than 10 or greater than 20
select team, 
       offsides
from overall_wc_stats ows 
where ows.offsides < 10 or ows.offsides > 20;

#32. Write an SQL query to show team, aerials_won, aerials_lost, aerials_won_pct in descending order by aerials_won_pct
select team,
       aerials_won,
       aerials_lost,
       aerials_won_pct 
from overall_wc_stats ows 
order by aerials_won_pct desc;
      
#33. Write an SQL query to show number of teams each group has!
select `group`,
       count(*)
from group_stage_team_stats gsts 
group by `group`;

#34.Write a SQL query to show team names group 6 has
select team
from group_stage_team_stats gsts 
where gsts.`group` = 6;

#35. Write an SQL query to show Australia belongs to which group
select `group`
from group_stage_team_stats gsts 
where gsts.team = "Australia";

#36. Write an SQL query to show group, average wins by each group
select `group`,
       avg(wins) as avg_wins
from group_stage_team_stats gsts 
group by `group`;

#37. Write an SQL query to show group, maximum expected_goal_scored by each group in ascending order by expected_goal_scored
select `group`,
       max(expected_goal_scored) as expected_goal_scored
from group_stage_team_stats gsts 
group by `group` 
order by expected_goal_scored;

#38. Write an SQL query to show group, minimum exp_goal_conceded by each group in descending order by exp_goal_conceded
select `group`,
       min(expected_goal_scored) as expected_goal_scored
from group_stage_team_stats gsts 
group by `group` 
order by expected_goal_scored desc;

#39. Write an SQL query to show group, average exp_goal_difference_per_90 for each group in ascending order by exp_goal_difference_per_90
select `group`,
       avg(exp_goal_difference_per_90) as exp_goal_difference_per90
from group_stage_team_stats gsts 
group by `group`
order by exp_goal_difference_per90 ;

#40. Write an SQL query to show which team has equal number of goals_scored and goals_against
select team
from overall_wc_stats ows 
where ows.goals_pens = ows.on_goals_against; 

#41. Write an SQL query to show which team has maximum players_used
select team
from overall_wc_stats ows
order by ows.players_used desc
limit 1;

#42. Write an SQL query to show team, players_used, avg_age, games, minutes where minutes lessthan 500 and greater than 200
select team,
       players_used,
       avg_age,
       games,
       minutes
from overall_wc_stats ows 
where ows.minutes < 500 and ows.minutes > 200;


#43. Write an SQL query to show all data of group_stats in ascending order BY points
select * from group_stage_team_stats gsts 
order by gsts.points;

#44. Write an SQL query to show ALL UNIQUE team in ascending order by team
select distinct team
from overall_wc_stats ows 
order by team;

#45. Write an SQL query to show average avg_age of each group and arrange it in descending order by avg_age.
select gsts.`group`,
       avg(ows.avg_age) as avg_age
from group_stage_team_stats gsts 
join overall_wc_stats ows 
on gsts.team = ows.team 
group by gsts.`group` 
order by avg_age desc;

#46. Write an SQL query to show sum of fouls for each group and arrange it in ascending order by fouls.
select gsts.`group`,
       sum(ows.fouls) as fouls
from group_stage_team_stats gsts 
join overall_wc_stats ows 
on gsts.team = ows.team 
group by gsts.`group` 
order by fouls;

#47. Write an SQL query to show total number of games for each group and arrange it in descending order by games.
select gsts.`group`,
       sum(ows.games) as games
from group_stage_team_stats gsts 
join overall_wc_stats ows 
on gsts.team = ows.team 
group by gsts.`group` 
order by games desc;

#48. Write an SQL query to show total number of players_used for each group and arrange it in ascending order by players_used.
select gsts.`group`,
       sum(ows.players_used ) as players_used
from group_stage_team_stats gsts 
join overall_wc_stats ows 
on gsts.team = ows.team 
group by gsts.`group` 
order by players_used;

#49. Write an SQL query to show total number of offsides for each group and arrange it in ascending order by offsides.
select gsts.`group`,
       sum(ows.offsides) as offsides
from group_stage_team_stats gsts 
join overall_wc_stats ows 
on gsts.team = ows.team 
group by gsts.`group` 
order by offsides;

#50. Write an SQL query to show average passes_pct for each group and arrange it in descending order by passes_pct.
select gsts.`group`,
       avg(ows.passes_pct) as passes_pct
from group_stage_team_stats gsts 
join overall_wc_stats ows 
on gsts.team = ows.team 
group by gsts.`group` 
order by passes_pct desc;

#51. Write an SQL query to show average goals_per90 for each group and arrange it in ascending order by goals_per90.
select gsts.`group`,
       avg(ows.goals_per90) as goals_per90
from group_stage_team_stats gsts 
join overall_wc_stats ows 
on gsts.team = ows.team 
group by gsts.`group` 
order by goals_per90 asc;


