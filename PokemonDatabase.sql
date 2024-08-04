DROP DATABASE IF EXISTS pokemon_db;

CREATE DATABASE pokemon_db;
USE pokemon_db;


CREATE TABLE Pokemon (
    pokemon_id INT PRIMARY KEY,
    name VARCHAR(50),
    type1 VARCHAR(20),
    type2 VARCHAR(20),
    generation INT
);

CREATE TABLE Stats (
    stat_id INT PRIMARY KEY,
    pokemon_id INT,
    hp INT,
    attack INT,
    defense INT,
    special_attack INT,
    special_defense INT,
    speed INT,
    FOREIGN KEY (pokemon_id) REFERENCES Pokemon(pokemon_id)
);

CREATE TABLE Abilities (
    ability_id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE Pokemon_Abilities (
    pokemon_id INT,
    ability_id INT,
    PRIMARY KEY (pokemon_id, ability_id),
    FOREIGN KEY (pokemon_id) REFERENCES Pokemon(pokemon_id),
    FOREIGN KEY (ability_id) REFERENCES Abilities(ability_id)
);

CREATE TABLE Moves (
    move_id INT PRIMARY KEY,
    name VARCHAR(50),
    type VARCHAR(20),
    power INT,
    accuracy INT,
    pp INT
);

CREATE TABLE Pokemon_Moves (
    pokemon_id INT,
    move_id INT,
    learn_method ENUM('level_up', 'tm', 'hm', 'egg', 'tutor', 'other'),
    level INT,
    PRIMARY KEY (pokemon_id, move_id, learn_method, level),
    FOREIGN KEY (pokemon_id) REFERENCES Pokemon(pokemon_id),
    FOREIGN KEY (move_id) REFERENCES Moves(move_id)
);


INSERT INTO Pokemon (pokemon_id, name, type1, type2, generation) VALUES
(1, 'Bulbasaur', 'Grass', 'Poison', 1),
(4, 'Charmander', 'Fire', NULL, 1),
(152, 'Chikorita', 'Grass', NULL, 2);

INSERT INTO Stats (stat_id, pokemon_id, hp, attack, defense, special_attack, special_defense, speed) VALUES
(1, 1, 45, 49, 49, 65, 65, 45),
(2, 4, 39, 52, 43, 60, 50, 65),
(3, 152, 45, 49, 65, 49, 65, 45);

INSERT INTO Abilities (ability_id, name) VALUES
(1, 'Overgrow'),
(2, 'Blaze'),
(3, 'Torrent');

INSERT INTO Pokemon_Abilities (pokemon_id, ability_id) VALUES
(1, 1),
(4, 2),
(152, 1);

INSERT INTO Moves (move_id, name, type, power, accuracy, pp) VALUES
(1, 'Tackle', 'Normal', 40, 100, 35),
(2, 'Ember', 'Fire', 40, 100, 25),
(3, 'Razor Leaf', 'Grass', 55, 95, 25);

INSERT INTO Pokemon_Moves (pokemon_id, move_id, learn_method, level) VALUES
(1, 1, 'level_up', 1),
(4, 2, 'level_up', 7),
(152, 3, 'level_up', 6);
