CREATE DATABASE PokemonDB;
USE PokemonDB;

CREATE TABLE PokemonTypes 
    (
    TypeID INT PRIMARY KEY NOT NULL,
    TypeName VARCHAR(60) NOT NULL
    );


INSERT INTO PokemonTypes (TypeName, TypeID) VALUES ('Normal', 1);
INSERT INTO PokemonTypes (TypeName, TypeID) VALUES ('Fire', 2);
INSERT INTO PokemonTypes (TypeName, TypeID) VALUES ('Water', 3);
INSERT INTO PokemonTypes (TypeName, TypeID) VALUES ('Electric', 4);
INSERT INTO PokemonTypes (TypeName, TypeID) VALUES ('Grass', 5);
INSERT INTO PokemonTypes (TypeName, TypeID) VALUES ('Ice', 6);
INSERT INTO PokemonTypes (TypeName, TypeID) VALUES ('Fighting', 7);
INSERT INTO PokemonTypes (TypeName, TypeID) VALUES ('Poison', 8);
INSERT INTO PokemonTypes (TypeName, TypeID) VALUES ('Ground', 9);
INSERT INTO PokemonTypes (TypeName, TypeID) VALUES ('Flying', 10);
INSERT INTO PokemonTypes (TypeName, TypeID) VALUES ('Psychic', 11);
INSERT INTO PokemonTypes (TypeName, TypeID) VALUES ('Bug', 12);
INSERT INTO PokemonTypes (TypeName, TypeID) VALUES ('Rock', 13);
INSERT INTO PokemonTypes (TypeName, TypeID) VALUES ('Ghost', 14);
INSERT INTO PokemonTypes (TypeName, TypeID) VALUES ('Dragon', 15);
INSERT INTO PokemonTypes (TypeName, TypeID) VALUES ('Dark', 16);
INSERT INTO PokemonTypes (TypeName, TypeID) VALUES ('Steel', 17);
INSERT INTO PokemonTypes (TypeName, TypeID) VALUES ('Fairy', 18);
-- LOAD DATA INFILE '/path/to/your/csv/pokemon_types.csv'
-- INTO TABLE PokemonTypes
-- FIELDS TERMINATED BY ',' 
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS
-- (TypeName);