/* 
chmod +x queries.sh
chmod +x insert_data.sh

./queries.sh
./insert_data.sh

psql --username=freecodecamp --dbname=postgres

CREATE DATABASE worldcup;
\c worldcup

CREATE TABLE teams(
    team_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL UNIQUE
);
      
CREATE TABLE games(
    game_id SERIAL PRIMARY KEY,
    year INT NOT NULL,
    round VARCHAR NOT NULL,
    winner_id INT NOT NULL,
    opponent_id INT NOT NULL,
    winner_goals INT NOT NULL,
    opponent_goals INT NOT NULL,
      
    FOREIGN KEY (opponent_id) REFERENCES teams(team_id),
    FOREIGN KEY (winner_id) REFERENCES teams(team_id)
);

*/