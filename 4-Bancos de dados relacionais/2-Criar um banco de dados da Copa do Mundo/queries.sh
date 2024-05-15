#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"
#68

echo -e "\nTotal number of goals in all games from both teams combined:"
#90
echo

echo -e "\nAverage number of goals in all games from the winning teams:"
#2.1250000000000000
echo $($PSQL "select avg(winner_goals) from teams full join games on teams.team_id = games.winner_id ;")

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
#2.13
echo

echo -e "\nAverage number of goals in all games from both teams:"
#2.8125000000000000
echo

echo -e "\nMost goals scored in a single game by one team:"
#7
echo

echo -e "\nNumber of games where the winning team scored more than two goals:"
#6
echo

echo -e "\nWinner of the 2018 tournament team name:"
#France
echo

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
#Algeria
#Argentina
#Belgium
#Brazil
#Chile
#Colombia
#Costa Rica
#France
#Germany
#Greece
#Mexico
#Netherlands
#Nigeria
#Switzerland
#United States
#Uruguay
echo select distinct(name) from teams full join games on teams.team_id = games.winner_id where year = '2014' and round = 'Eighth-Final' order by name;

echo -e "\nList of unique winning team names in the whole data set:"
#Argentina
#Belgium
#Brazil
#Colombia
#Costa Rica
#Croatia
#England
#France
#Germany
#Netherlands
#Russia
#Sweden
#Uruguay
echo

echo -e "\nYear and team name of all the champions:"
#2014|Germany
#2018|France
echo

echo -e "\nList of teams that start with 'Co':"
#Colombia
#Costa Rica
echo

#select * from teams full join games on teams.team_id = games.winner_id where name = 'France';