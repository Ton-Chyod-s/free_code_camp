#! /bin/bash

PSQL="psql -U postgres -t --no-align --dbname=number_guess"

NUM_RANDOM=$RANDOM

echo "Enter your username:"
read NAME

ID_NAME=$($PSQL -c "SELECT id_name FROM players WHERE name = '$NAME';")

GAMES_PLAYED=$($PSQL -c "SELECT count(tentativa) FROM game WHERE id_name = $ID_NAME;")

BEST_GAME=$($PSQL -c "SELECT max(tentativa) FROM game WHERE id_name = $ID_NAME;")

if [[ ! -z $ID_NAME ]]; then
    echo "Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi



echo "Welcome, $NAME! It looks like this is your first time here."

echo "Guess the secret number between 1 and 1000:"

echo "It's lower than that, guess again:"

echo "It's higher than that, guess again:"

echo "That is not an integer, guess again:"

echo "You guessed it in <number_of_guesses> tries. The secret number was <secret_number>. Nice job!"