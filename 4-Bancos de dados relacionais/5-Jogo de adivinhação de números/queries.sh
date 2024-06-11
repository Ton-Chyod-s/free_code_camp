#!/bin/bash

PSQL="psql -U postgres -t --no-align --dbname=number_guess"

NUM_RANDOM=$((RANDOM % 1000 + 1))
echo "Enter your username:"
read NAME

function check_name {
  ID_NAME=$($PSQL -c "SELECT id_name FROM name WHERE nome = '$NAME';" | xargs)

  if [[ -z $ID_NAME ]]; then
    echo "Welcome, $NAME! It looks like this is your first time here."
    $PSQL -c "INSERT INTO name(nome) VALUES ('$NAME');"
    ID_NAME=$($PSQL -c "SELECT id_name FROM name WHERE nome = '$NAME';" | xargs)
  else
    NAME_DATABASE=$($PSQL -c "SELECT nome FROM name WHERE id_name = $ID_NAME;" | xargs)
    GAMES_PLAYED=$($PSQL -c "SELECT count(tentativa) FROM game WHERE id_name = $ID_NAME;" | xargs)
    BEST_GAME=$($PSQL -c "SELECT min(tentativa) FROM game WHERE id_name = $ID_NAME;" | xargs)

    echo "Welcome back, $NAME_DATABASE! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi
}

function play_game {
  ATTEMPTS=0
  while true; do
    echo -e "\nGuess the secret number between 1 and 1000:"
    read SECRET_NUMBER
    
    if [[ $SECRET_NUMBER =~ ^[0-9]+$ ]]; then
      ((ATTEMPTS++))
      if (( SECRET_NUMBER > NUM_RANDOM )); then
        echo "It's lower than that, guess again:"
      elif (( SECRET_NUMBER < NUM_RANDOM )); then
        echo "It's higher than that, guess again:"
      else
        $PSQL -c "INSERT INTO game(numero, tentativa, id_name) VALUES ($NUM_RANDOM, $ATTEMPTS, $ID_NAME);"
        echo -e "\nYou guessed it in $ATTEMPTS tries. The secret number was $NUM_RANDOM. Nice job!\n"
        exit
      fi
    else
      echo "That is not an integer, guess again:"
    fi
  done
}

check_name
play_game
