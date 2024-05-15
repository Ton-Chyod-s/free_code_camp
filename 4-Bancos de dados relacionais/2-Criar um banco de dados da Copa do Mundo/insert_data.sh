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
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS; do
    # Print the year
    echo "Year: $YEAR"

    # Accessing each element
    echo "Round: $ROUND"
    echo "Winner: $WINNER"
    echo "Opponent: $OPPONENT"
    echo "Winner Goals: $WINNER_GOALS"
    echo "Opponent Goals: $OPPONENT_GOALS"

    # Perform other operations here
done