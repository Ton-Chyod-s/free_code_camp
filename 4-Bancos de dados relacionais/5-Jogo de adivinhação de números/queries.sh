#! /bin/bash

PSQL="psql -U postgres -t --no-align --dbname=number_guess"

NUM_RANDOM=$RANDOM

echo "Enter your username:"
read NAME

ID_NAME=$($PSQL -c "SELECT id_name FROM name WHERE nome = '$NAME';")

if [[ -z $ID_NAME ]]; then
  echo "Welcome, $NAME! It looks like this is your first time here."
  INSERT_NAME=$($PSQL "insert into name (nome) values ('$NAME') returning id_name;")

  echo "Guess the secret number between 1 and 1000:"

else
  GAMES_PLAYED=$($PSQL -c "SELECT count(tentativa) FROM game WHERE id_name = $ID_NAME;")

  BEST_GAME=$($PSQL -c "SELECT max(tentativa) FROM game WHERE id_name = $ID_NAME;")

  echo "Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi











# echo "It's lower than that, guess again:"

# echo "It's higher than that, guess again:"

# echo "That is not an integer, guess again:"

# echo "You guessed it in <number_of_guesses> tries. The secret number was <secret_number>. Nice job!"