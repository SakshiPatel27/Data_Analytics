# FIFA World Cup Database Project

## Overview
This SQL project contains comprehensive FIFA World Cup data including team statistics, match results, and performance metrics. The project includes multiple tables tracking team performance across group stages and overall tournament results.

## Database Structure

### Tables

#### 1. **group_stats**
Contains group stage statistics for each team.

**Columns:**
- `team` - Team name
- `group` - Group designation (1-7, etc.)
- `rank` - Rank within the group (1-4)
- `matches_played` - Number of matches played
- `wins` - Number of wins
- `draws` - Number of draws
- `losses` - Number of losses
- `goals_scored` - Total goals scored
- `goals_against` - Total goals conceded
- `goal_difference` - Goals scored minus goals against
- `points` - Total points earned (3 for win, 1 for draw)

#### 2. **team_data**
Contains detailed team information.

**Columns:**
- `team` - Team name
- `group` - Group number
- `position` - Final position in group
- Additional team statistics

#### 3. **data_metadescription**
Contains metadata and column descriptions for the dataset.

## Data Files
- `fifa.sql` - SQL script with database creation and analysis queries
- `group_stats.csv` - Group stage statistics
- `team_data.csv` - Team information
- `data_metadescription.csv` - Data dictionary

## Key Queries Included

### 1. **Team Information**
- Show all unique team names
- Count total teams
- Teams by group
- Rank 1 team in specific group

### 2. **Performance Metrics**
- Matches played by each team
- Win percentage calculation
- Loss percentage
- Draw percentage
- Goal-scoring analysis

### 3. **Goal Analysis**
- Maximum goals scored (top scorer)
- Minimum goals scored
- Goals conceded analysis
- Goal difference rankings
- Average goals per match

### 4. **Group Standings**
- Teams ranked by group
- Points calculation and verification
- Group winners identification
- Advancement criteria

### 5. **Statistical Analysis**
- Win/Loss/Draw distributions
- Goal-scoring efficiency
- Defensive performance
- Points per match ratio

## Business Insights

### Tournament Structure
- Multiple groups (typically 7-8)
- 4 teams per group
- 6 matches per team (round-robin format)
- Top teams advance from each group

### Performance Metrics
- **Win Percentage**: (Wins / Matches Played) × 100
- **Points System**: 3 points for win, 1 point for draw, 0 for loss
- **Goal Difference**: Critical tiebreaker
- **Goal-Scoring Efficiency**: Goals scored relative to shots/chances

### Team Classifications
- **Strong Teams**: High win percentage, positive goal difference
- **Competitive Teams**: Mix of wins/draws, balanced goals
- **Struggling Teams**: Low win percentage, negative goal difference

## Use Cases

1. **Tournament Analysis** - Analyze group stage results and predictions
2. **Team Comparison** - Compare performance across different teams
3. **Performance Tracking** - Monitor team progress through tournament
4. **Statistical Analysis** - Calculate advanced soccer metrics
5. **Match Prediction** - Use historical data for future predictions
6. **Scout Reports** - Evaluate team strengths and weaknesses
7. **Fan Analytics** - Engage fans with statistics and comparisons
8. **Strategic Planning** - Plan knockout stage matchups

## Sample Analytics

### Queries to Try
- **All teams grouped by performance:**
```sql
SELECT team, matches_played, wins, draws, losses, goals_scored, goals_against,
       ROUND((wins*100.0)/matches_played, 2) as win_percentage,
       goals_scored - goals_against as goal_difference,
       (wins * 3) + draws as points
FROM group_stats
ORDER BY points DESC, goal_difference DESC;
```

- **Top scorers from each group:**
```sql
SELECT `group`, team, goals_scored
FROM group_stats
WHERE (team, goals_scored) IN (
    SELECT `group`, team FROM group_stats
    WHERE goals_scored = (
        SELECT MAX(goals_scored) FROM group_stats gs2 WHERE gs2.`group` = group_stats.`group`
    )
);
```

- **Best defensive teams:**
```sql
SELECT team, goals_against, ROUND((goals_against / matches_played), 2) as goals_conceded_per_match
FROM group_stats
ORDER BY goals_against ASC
LIMIT 10;
```

- **Most consistent teams:**
```sql
SELECT team, wins, draws, losses,
       CASE 
           WHEN wins > 3 THEN 'Strong Performer'
           WHEN wins >= 2 THEN 'Solid Performer'
           WHEN wins = 1 THEN 'Moderate Performer'
           ELSE 'Struggling'
       END as performance_category
FROM group_stats
ORDER BY wins DESC;
```

- **Group standings by points:**
```sql
SELECT `group`, team, `rank`, matches_played, wins, draws, losses, 
       goals_scored, goals_against, (wins * 3) + draws as points
FROM group_stats
ORDER BY `group`, `rank`;
```

## Tournament Statistics

### Possible Metrics
- **Total Teams**: Typically 32 teams
- **Groups**: Usually 8 groups of 4 teams
- **Total Group Matches**: 48 (6 per group)
- **Teams Advancing**: 16 (top 2 from each group)
- **Knockout Stage**: Round of 16, Quarterfinals, Semifinals, Final

### Performance Distribution
- **Top Teams**: High win rate (60-100%), positive goal differential
- **Mid-tier Teams**: Mixed record (33-50% win rate)
- **Lower-ranked Teams**: Low win rate (0-33%)

## Prerequisites
- MySQL or compatible SQL database
- CSV import capability
- SQL knowledge for data analysis
- Understanding of soccer/football basics

## Setup Instructions
1. Create the FIFA database
2. Create and populate tables from SQL script
3. Import CSV data into respective tables
4. Verify data integrity
5. Run analysis queries

## Advanced Analytics Options
- Compare team performance by possession stats
- Analyze goal-scoring patterns
- Track player statistics
- Match-level detail analysis
- Predict knockout stage outcomes

---

**Last Updated**: August 2026  
**Database Type**: MySQL  
**Sport**: International Football (Soccer)  
**Tournament**: FIFA World Cup
