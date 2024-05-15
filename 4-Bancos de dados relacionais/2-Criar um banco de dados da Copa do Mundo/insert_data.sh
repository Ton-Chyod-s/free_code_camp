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
    # get game_id
    GAME_ID=$($PSQL "SELECT game_id FROM games WHERE year='$YEAR'")

    TEAM_ID_WINNER=$($PSQL "SELECT name FROM teams WHERE name = '$WINNER'")
    TEAM_ID_OPPONENT=$($PSQL "SELECT name FROM teams WHERE name = '$OPPONENT'")

    # if not found winner
    if [[ -z $TEAM_ID_WINNER ]] 
    then
      echo "$($PSQL "INSERT INTO teams(name) values('$WINNER')")"
    fi

    # if not found opponent
    if [[ -z $TEAM_ID_OPPONENT ]] 
    then
      echo "$($PSQL "INSERT INTO teams(name) values('$OPPONENT')")"
    fi
done

#echo "Year: $YEAR"
#echo "Round: $ROUND"
#echo "Winner: $WINNER"
#echo "Opponent: $OPPONENT"
#echo "Winner Goals: $WINNER_GOALS"
#echo "Opponent Goals: $OPPONENT_GOALS"
