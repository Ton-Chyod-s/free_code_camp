/* 
chmod +x queries.sh
chmod +x insert_data.sh

./queries.sh
./insert_data.sh

psql --username=freecodecamp --dbname=postgres

CREATE DATABASE worldcup;
\c worldcup

CREATE TABLE teams();
CREATE TABLE games();

ALTER TABLE teams 
ADD COLUMN team_id SERIAL PRIMARY KEY;

ALTER TABLE teams 
ADD COLUMN name VARCHAR NOT NULL UNIQUE;

ALTER TABLE games 
ADD COLUMN game_id SERIAL PRIMARY KEY;

ALTER TABLE games 
ADD COLUMN year INT NOT NULL;

ALTER TABLE games 
ADD COLUMN round VARCHAR NOT NULL;

ALTER TABLE games 
ADD COLUMN winner_id INT NOT NULL;

ALTER TABLE games 
ADD COLUMN opponent_id INT NOT NULL;

ALTER TABLE games 
ADD COLUMN winner_goals INT NOT NULL;

ALTER TABLE games 
ADD COLUMN opponent_goals INT NOT NULL;

ALTER TABLE games
ADD CONSTRAINT fk_winner_id FOREIGN KEY (winner_id) REFERENCES teams(team_id);

ALTER TABLE games
ADD CONSTRAINT fk_opponent_id FOREIGN KEY (opponent_id) REFERENCES teams(team_id);

*/