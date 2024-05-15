#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo "$($PSQL "Truncate games, teams")"

cat games.csv | while IF="," read year round winner
do

#year
ANO_ID=$($PSQL "")
echo $ANO_ID
#round

#winner

#opponent

#winner_goals

#opponent_goals

done
