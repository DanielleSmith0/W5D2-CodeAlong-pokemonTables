CREATE TABLE pokemon_species(
  id SERIAL PRIMARY KEY,
  name VARCHAR NOT NULL,
  primary_color VARCHAR NOT NULL,
  gen INT NOT NULL
);

CREATE TABLE pokemon_idv(
  id SERIAL PRIMARY KEY,
  pokemon_species_id INT NOT NULL REFERENCES pokemon_species(id),
  temperament VARCHAR NOT NULL,
  nickname VARCHAR,
  level INT NOT NULL,
  is_shiny BOOLEAN NOT NULL
);

CREATE TABLE trainers(
  id SERIAL PRIMARY KEY,
  pokemon_idv_id INT NOT NULL UNIQUE REFERENCES pokemon_idv(id),
  name VARCHAR(50) NOT NULL,
  age INT NOT NULL,
  badges_accquired INT NOT NULL
);

CREATE TABLE moves(
  id SERIAL PRIMARY KEY,
  power INT,
  effect VARCHAR,
  type VARCHAR NOT NULL,
  accuracy_percentage INT NOT NULL
);

CREATE TABLE pokemon_moves(
  id SERIAL PRIMARY KEY,
  pokemon_idv_id INT NOT NULL REFERENCES pokemon_idv(id),
  moves_id INT NOT NULL REFERENCES moves(id)
);

--INFO FOR TABLES:

INSERT INTO pokemon_species (name, primary_color, gen) VALUES
('Charizard', 'orange', 1),
('Pikachu', 'yellow', 1),
('Blastoise', 'blue', 1),
('Artucino', 'blue', 1),
('Todile', 'blue', 1);

SELECT * FROM pokemon_species;

INSERT INTO pokemon_idv (pokemon_species_id, temperament, nickname, level, is_shiny) VALUES
(2, 'rowdy', 'bonsai', 32, FALSE),
(3, 'sleepy', 'NULL', 50, FALSE),
(5, 'rowdy', 'snappers', 5, TRUE),
(5, 'docile', 'rasputen', 98, TRUE);

ALTER TABLE moves ADD name VARCHAR NOT NULL UNIQUE;

INSERT INTO moves (power, effect, type, accuracy_percentage, name) VALUES
(NULL, 'accuracy reduced by one stage', 'normal', 100, 'sand attack'),
(100, NULL, 'ground', 100, 'earthquake'),
(95, '10% chance to freeze foe', 'ice', 100, 'ice beam'),
(120, '33% chance to burn foe', 'fire', 85, 'fire blast');

SELECT * FROM moves;

-- INSERT INTO trainers (name, age, badges_acquired, pokemon_idv_id)
-- VALUES ('Ash', 10, 108, 5);

-- SELECT * FROM pokemon_idv;
-- SELECT * FROM moves;

INSERT INTO pokemon_moves (pokemon_idv_id, moves_id) VALUES
(1, 1),
(1, 2),
(1, 4),
(2, 3),
(3, 3),
(4, 4),
(4, 3),
(3, 1);