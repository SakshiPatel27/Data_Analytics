# Sky Sports World Cup Database Project

## Overview
This SQL project contains comprehensive world cup statistics and analysis from Sky Sports. The project includes detailed team performance data from group stage matches and overall tournament statistics.

## Database Structure

### Tables

#### 1. **group_stage_team_stats**
Contains group stage statistics for each team participating in world cup tournament.

**Columns:**
- `team` - Team name
- `group` - Group designation (1-8)
- `rank` - Rank within the group (1-4)
- `matches_played` - Number of group stage matches
- `wins` - Number of matches won
- `draws` - Number of matches drawn
- `losses` - Number of matches lost
- `goals_scored` - Total goals scored in group stage
- `goals_against` - Total goals conceded
- `goal_difference` - Goals scored minus goals against
- `points` - Total points earned (3 for win, 1 for draw)

#### 2. **overall_wc_stats**
Contains overall tournament statistics and records.

**Columns:**
- Various tournament-wide metrics
- Historical records
- Top performers
- Final standings

## Data Files
- `sky_sports.sql` - SQL script with database creation and analysis queries
- `group_stage_team_stats.csv` - Group stage statistics
- `overall_wc_stats.csv` - Overall tournament data

## Key Queries Included

### 1. **Team Information**
- Show all unique team names
- Count total participating teams
- Teams organized by group
- Group rank 1 teams (qualifiers)

### 2. **Group Stage Analysis**
- Matches played by each team
- Win percentage calculations
- Draw percentage analysis
- Loss rate computations

### 3. **Scoring Analysis**
- Team with maximum goals scored
- Team with minimum goals scored
- Goals conceded analysis
- Goal difference rankings

### 4. **Performance Statistics**
- Draw percentage by team
- Win/loss ratios
- Points per match
- Advancement criteria

### 5. **Tournament Overview**
- Overall tournament statistics
- Historical comparisons
- Record holders
- Final tournament standings

## Business Insights

### Tournament Format
- **Groups**: 8 groups with 4 teams each
- **Group Matches**: 6 matches per team (round-robin)
- **Qualification**: Top 2 teams per group advance (16 total)
- **Knockout**: Round of 16, Quarterfinals, Semifinals, Final

### Performance Levels
- **Elite Teams**: High win percentage (70-100%), large positive goal difference
- **Strong Teams**: Consistent wins (60-70% win rate)
- **Competitive Teams**: Mixed results, draw-heavy records
- **Struggling Teams**: Low win percentage, negative goal difference

### Key Metrics
- **Points System**: 3 points per win, 1 per draw, 0 for loss
- **Tiebreaker**: Goal difference is critical
- **Efficiency**: Goals per match indicator
- **Defense**: Goals against per match

## Use Cases

1. **Tournament Analysis** - Comprehensive group stage performance review
2. **Team Comparison** - Head-to-head comparative analysis
3. **Prediction Models** - Forecast knockout stage outcomes
4. **Sports Commentary** - Data-driven game analysis
5. **Broadcast Analytics** - Provide viewers with statistics
6. **Betting Analysis** - Probability and odds calculation
7. **Historical Comparison** - Year-to-year performance trends
8. **Player Scout Reports** - Team performance assessment

## Sample Analytics

### Queries to Try
- **Complete group standings:**
```sql
SELECT `group`, team, `rank`, matches_played, wins, draws, losses, 
       goals_scored, goals_against, (wins * 3) + draws as points
FROM group_stage_team_stats
ORDER BY `group`, `rank`;
```

- **Top goal scorers (teams):**
```sql
SELECT team, goals_scored, ROUND(goals_scored / matches_played, 2) as goals_per_match
FROM group_stage_team_stats
ORDER BY goals_scored DESC
LIMIT 10;
```

- **Best defensive teams:**
```sql
SELECT team, goals_against, ROUND(goals_against / matches_played, 2) as goals_conceded_per_match
FROM group_stage_team_stats
ORDER BY goals_against ASC
LIMIT 10;
```

- **Win percentage leaderboard:**
```sql
SELECT team, matches_played, wins, 
       ROUND((wins * 100.0) / matches_played, 2) as win_percentage,
       (wins * 3) + draws as points
FROM group_stage_team_stats
ORDER BY win_percentage DESC;
```

- **Goal difference rankings:**
```sql
SELECT team, goals_scored, goals_against, 
       (goals_scored - goals_against) as goal_difference
FROM group_stage_team_stats
ORDER BY goal_difference DESC;
```

- **Groups with strongest teams:**
```sql
SELECT `group`, team, `rank`, (wins * 3) + draws as points
FROM group_stage_team_stats
WHERE `rank` = 1
ORDER BY `group`;
```

- **Teams in each group:**
```sql
SELECT `group`, GROUP_CONCAT(team ORDER BY `rank`) as teams_in_group
FROM group_stage_team_stats
GROUP BY `group`
ORDER BY `group`;
```

- **Average performance by group:**
```sql
SELECT `group`, 
       ROUND(AVG(goals_scored), 2) as avg_goals_scored,
       ROUND(AVG(goals_against), 2) as avg_goals_conceded,
       COUNT(*) as team_count
FROM group_stage_team_stats
GROUP BY `group`;
```

## Advanced Analytics

### Performance Tiers
- **Tier 1 (Qualified with high points)**: Top 2 teams in each group with 7+ points
- **Tier 2 (Close qualifiers)**: Teams with 4-6 points
- **Tier 3 (Elimination)**: Teams with 1-3 points
- **Tier 4 (No wins)**: Teams with 0 points

### Statistical Insights
- **Home/Away Advantage**: Visible in goal scoring patterns
- **Defensive vs Offensive**: Goal difference indicator
- **Consistency**: Draw patterns show cautious teams
- **Momentum**: Win streaks in tournament

## Tournament Statistics

### Possible Tournament-Level Data
- **Total Teams**: 32 teams
- **Total Groups**: 8 groups
- **Total Group Matches**: 48 matches
- **Qualified Teams**: 16 teams (knockout stage)
- **Total Tournament Matches**: 64 matches (including knockouts and finals)

## Prerequisites
- MySQL or compatible SQL database
- CSV data import capability
- SQL proficiency
- Soccer/football knowledge

## Setup Instructions
1. Create the Sky Sports database
2. Execute the SQL script
3. Import CSV data into tables
4. Verify data consistency
5. Run analysis queries

## Performance Optimization
- Index on team names for quick lookups
- Index on group for group-level queries
- Materialized views for common reports
- Partition by group for faster filtering
- Cache frequently used aggregations

## Advanced Features
- Compare tournament editions (year-over-year)
- Track team performance history
- Predict knockout stage scenarios
- Analyze group stage dynamics
- Calculate qualification probabilities

---

**Last Updated**: August 2026  
**Database Type**: MySQL  
**Sport**: International Football (Soccer)  
**Source**: Sky Sports  
**Tournament**: FIFA World Cup
