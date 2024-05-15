#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo "$($PSQL "TRUNCATE TABLE games, teams")"

# Read the CSV file line by line
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS; 
do
    TEAM_ID_WINNER=$($PSQL "SELECT name FROM teams WHERE name = '$WINNER'")
    # if not found winner
    if [[ -z $TEAM_ID_WINNER && $WINNER != 'winner' ]] 
    then
      echo "$($PSQL "INSERT INTO teams(name) values('$WINNER')")"
    fi

    TEAM_ID_OPPONENT=$($PSQL "SELECT name FROM teams WHERE name = '$OPPONENT'")
    # if not found opponent
    if [[ -z $TEAM_ID_OPPONENT && $OPPONENT != 'opponent' ]] 
    then
      echo "$($PSQL "INSERT INTO teams(name) values('$OPPONENT')")"
    fi

    #obtendo id vencedor e oponente
    TEAM_ID_WINNER="$($PSQL "SELECT team_id from teams where name = '$WINNER'")"
    TEAM_ID_OPPONENT="$($PSQL "SELECT team_id from teams where name = '$OPPONENT'")"

    echo "$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) values('$YEAR','$ROUND','$TEAM_ID_WINNER','$TEAM_ID_OPPONENT','$WINNER_GOALS','$OPPONENT_GOALS')")"

done < games.csv