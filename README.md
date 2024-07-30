# Utah_Grizzlies
Utah Grizzlies DataBase

Overview
This repository contains the MySQL Workbench project for the Utah Grizzlies Hockey Team database. The database is designed to manage information related to the team, including players, matches, coaches, seasons, and statistics.

Database Structure
The database is normalized up to the third normal form (3NF) to ensure efficiency and eliminate redundancy. It consists of the following tables:

- Players
- Teams
- Matches
- Player_Stats
- Coaches
- Seasons
- Team_Seasons


Tables and Their Relationships:

Players Table
Primary Key: player_id
Fields: player_id, first_name, last_name, position, birthdate, nationality

Teams Table
Primary Key: team_id
Fields: team_id, team_name, established_year, home_arena

Matches Table
Primary Key: match_id
Fields: match_id, match_date, home_team_id, away_team_id, home_team_score, away_team_score
Foreign Keys: home_team_id (references Teams.team_id), away_team_id (references Teams.team_id)

Player_Stats Table
Primary Key: stat_id
Fields: stat_id, player_id, match_id, goals, assists, penalty_minutes
Foreign Keys: player_id (references Players.player_id), match_id (references Matches.match_id)

Coaches Table
Primary Key: coach_id
Fields: coach_id, first_name, last_name, team_id, role
Foreign Key: team_id (references Teams.team_id)
Seasons Table
Primary Key: season_id
Fields: season_id, season_year

Team_Seasons Table
Primary Key: team_season_id
Fields: team_season_id, team_id, season_id, wins, losses, draws
Foreign Keys: team_id (references Teams.team_id), season_id (references Seasons.season_id)




Relationships
Teams and Players

One-to-Many relationship: One team can have multiple players.
Teams and Matches

Many-to-Many relationship: A match involves two teams (home and away). This is managed by having home_team_id and away_team_id in the Matches table.
Matches and Player_Stats

One-to-Many relationship: A match can have multiple player statistics recorded for different players.
Teams and Coaches

One-to-Many relationship: One team can have multiple coaches with different roles.
Teams and Seasons

Many-to-Many relationship: A team can participate in multiple seasons, and a season can have multiple teams. This is managed by the Team_Seasons table.
