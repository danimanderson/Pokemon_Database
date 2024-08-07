DROP DATABASE IF EXISTS pokemon_db;

CREATE DATABASE pokemon_db;
USE pokemon_db;

CREATE TABLE Pokemon_Regions (
    ID INT PRIMARY KEY,
    Region VARCHAR(255) NOT NULL
);

CREATE TABLE Abilities (
    id INT PRIMARY KEY,
    identifier VARCHAR(255) NOT NULL,
    generation_id INT NOT NULL,
    FOREIGN KEY (generation_id) REFERENCES Pokemon_Regions(ID)
);

CREATE TABLE Pokemon_Types (
    TypeName VARCHAR(20) NOT NULL,
    NumberID INT PRIMARY KEY
);

CREATE TABLE Moves (
    move_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    generation_id INT NOT NULL,
    type_id INT NOT NULL,
    power INT,
    pp INT,
    accuracy INT,
    FOREIGN KEY (generation_id) REFERENCES Pokemon_Regions(ID)
);


CREATE TABLE Pokemon (
    pokemon_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    type1 INT NOT NULL,
    type2 INT DEFAULT NULL,
    generation INT NOT NULL,
    FOREIGN KEY (type1) REFERENCES Pokemon_Types(NumberID),
    FOREIGN KEY (type2) REFERENCES Pokemon_Types(NumberID),
    FOREIGN KEY (generation) REFERENCES Pokemon_Regions(ID)
);

CREATE TABLE Pokemon_Moves (
    pokemon_id INT,
    move_id MEDIUMTEXT,
    PRIMARY KEY (pokemon_id),
    FOREIGN KEY (pokemon_id) REFERENCES Pokemon(pokemon_id)
);


-- Load data into Pokemon_Regions table
LOAD DATA INFILE '/var/lib/mysql-files/Pokemon_Regions.csv'
INTO TABLE Pokemon_Regions
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(ID, Region);

-- Load data into TypesOfPokemon table first
LOAD DATA INFILE '/var/lib/mysql-files/pokemon_types.csv'
INTO TABLE Pokemon_Types
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(TypeName, NumberID);

-- Load data into Pokemon table, treating empty strings as NULL
LOAD DATA INFILE '/var/lib/mysql-files/pokemon.csv'
INTO TABLE Pokemon
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(pokemon_id, name, type1, @type2, generation)
SET type2 = NULLIF(@type2, '');

-- Load data into Moves table
LOAD DATA INFILE '/var/lib/mysql-files/moves.csv'
INTO TABLE Moves
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(move_id, name, generation_id, type_id, @power, @pp, accuracy)
SET power = NULLIF(@power, ''),
pp = NULLIF(@pp, '');

-- Load data into Abilities table
LOAD DATA INFILE '/var/lib/mysql-files/abilities.csv'
INTO TABLE Abilities
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id, identifier, generation_id);

-- Loads data in Pokemon_Moves table
LOAD DATA INFILE '/var/lib/mysql-files/pokemon_moves.csv'
INTO TABLE Pokemon_Moves
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(pokemon_id, move_id);


-- Correct table name in the SELECT statement
SELECT * FROM Pokemon_Types LIMIT 10;
SELECT * FROM Pokemon LIMIT 10;
SELECT * FROM Moves LIMIT 10;
SELECT * FROM Abilities LIMIT 10;
SELECT * FROM Pokemon_Regions LIMIT 10;
SELECT * FROM Pokemon_Moves LIMIT 10;