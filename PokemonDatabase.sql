DROP DATABASE IF EXISTS pokemon_db;

CREATE DATABASE IF NOT EXISTS pokemon_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE pokemon_db;

CREATE TABLE IF NOT EXISTS TypesOfPokemon (
    typeName VARCHAR(15),
    numberID INT PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS Pokemon (
    pokemon_id INT PRIMARY KEY,
    name VARCHAR(50),
    type1 INT,
    type2 INT,
    generation INT,
    FOREIGN KEY (type1) REFERENCES TypesOfPokemon(numberID),
    FOREIGN KEY (type2) REFERENCES TypesOfPokemon(numberID)
);

CREATE TABLE IF NOT EXISTS Stats (
    stat_id INT PRIMARY KEY AUTO_INCREMENT,
    pokemon_id INT,
    hp INT,
    attack INT,
    defense INT,
    special_attack INT,
    special_defense INT,
    speed INT,
    FOREIGN KEY (pokemon_id) REFERENCES Pokemon(pokemon_id)
);

CREATE TABLE IF NOT EXISTS Abilities (
    ability_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Pokemon_Abilities (
    pokemon_id INT,
    ability_id INT,
    PRIMARY KEY (pokemon_id, ability_id),
    FOREIGN KEY (pokemon_id) REFERENCES Pokemon(pokemon_id),
    FOREIGN KEY (ability_id) REFERENCES Abilities(ability_id)
);

CREATE TABLE IF NOT EXISTS Moves (
    move_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    type INT,
    power INT,
    accuracy INT,
    pp INT,
    FOREIGN KEY (type) REFERENCES TypesOfPokemon(numberID)
);

CREATE TABLE IF NOT EXISTS Pokemon_Moves (
    pokemon_id INT,
    move_id INT,
    learn_method ENUM('level_up', 'tm', 'hm', 'egg', 'tutor', 'other'),
    level INT,
    PRIMARY KEY (pokemon_id, move_id, learn_method, level),
    FOREIGN KEY (pokemon_id) REFERENCES Pokemon(pokemon_id),
    FOREIGN KEY (move_id) REFERENCES Moves(move_id)
);

-- Load data into TypesOfPokemon table first
LOAD DATA INFILE '/var/lib/mysql-files/pokemon_types.csv'
INTO TABLE TypesOfPokemon
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(typeName, numberID);

-- Load data into Pokemon table
LOAD DATA INFILE '/var/lib/mysql-files/pokemon.csv'
INTO TABLE Pokemon
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(pokemon_id, name, type1, type2, generation);

-- Correct table name in the SELECT statement
SELECT * FROM TypesOfPokemon;
