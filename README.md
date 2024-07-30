# Utah_Grizzlies
Utah Grizzlies DataBase

## Overview
This repository contains the SQL schema and data insertion scripts for the Utah Grizzlies hockey team database. The database captures information about the team, players, and their statistics.

## Database Structure

The database consists of three main tables:

1. **Teams**
2. **Players**
3. **PlayerStats**

### Teams Table

Stores information about the team.

- `team_id`: Primary Key
- `team_name`: Name of the team

### Players Table

Stores information about the players.

- `player_id`: Primary Key
- `team_id`: Foreign Key referencing `Teams.team_id`
- `player_name`: Name of the player
- `player_number`: Jersey number of the player
- `player_position`: Position of the player (F - Forward, D - Defense, G - Goalie)

### PlayerStats Table

Stores statistics for each player.

- `stat_id`: Primary Key
- `player_id`: Foreign Key referencing `Players.player_id`
- `GP`: Games Played
- `G`: Goals
- `A`: Assists
- `PTS`: Points
- `plus_minus`: Plus/Minus
- `PIM`: Penalty Minutes
- `PPG`: Power Play Goals
- `SHG`: Short Handed Goals
- `PT_per_G`: Points per Game
- `PIM_per_G`: Penalty Minutes per Game
- `SOG`: Shots on Goal
- `SH`: Shootout Goals
- `PPA`: Power Play Assists
- `SHA`: Short Handed Assists
- `GWG`: Game Winning Goals
- `FG`: First Goals
- `IG`: Insurance Goals
- `OTG`: Overtime Goals
- `UA`: Unassisted Goals
- `EN`: Empty Net Goals
- `W`: Wins (For Goalies)
- `GAA`: Goals Against Average (For Goalies)
- `SV_per`: Save Percentage (For Goalies)
- `MIN`: Minutes Played (For Goalies)
- `L`: Losses (For Goalies)
- `OTL`: Overtime Losses (For Goalies)
- `SA`: Shots Against (For Goalies)
- `GA`: Goals Against (For Goalies)
- `SOW`: Shootout Wins (For Goalies)
- `SOL`: Shootout Losses (For Goalies)
