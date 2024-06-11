#!/bin/bash

PSQL="psql -U postgres -t --no-align --dbname=number_guess"

NUM_RANDOM=$((RANDOM % 1000 + 1))
echo "Enter your username:"
read NAME

function initialize_game {
  username=$($PSQL -c "SELECT nome FROM name WHERE nome = '$NAME';")

  if [[ -z $username ]]; then
    INSERT_NAME=$($PSQL -c "INSERT INTO name(nome) VALUES ('$NAME');")

    echo "Welcome, $NAME! It looks like this is your first time here."

    ID_NAME=$($PSQL -c "SELECT id_name FROM name WHERE nome = '$NAME';")
  else
    ID_NAME=$($PSQL -c "SELECT id_name FROM name WHERE nome = '$username';")
    games_played=$($PSQL -c "SELECT count(tentativa) FROM game WHERE id_name = $ID_NAME;")
    best_game=$($PSQL -c "SELECT min(tentativa) FROM game WHERE id_name = $ID_NAME;")

    echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
  fi
  
  number_of_guesses=0

  while true; do
    echo -e "\nGuess the secret number between 1 and 1000:"
    read secret_number
    
    if [[ $secret_number =~ ^[0-9]+$ ]]; then
      ((number_of_guesses++))
      if (( secret_number > NUM_RANDOM )); then
        echo "It's higher than that, guess again:"
      elif (( secret_number < NUM_RANDOM )); then
        echo "It's lower than that, guess again:"
      else
        INSERT_GAME=$($PSQL -c "INSERT INTO game( numero, tentativa, id_name) VALUES ( $secret_number, $number_of_guesses, $ID_NAME);")
        echo -e "\nYou guessed it in $number_of_guesses tries. The secret number was $secret_number. Nice job!\n"
        exit
      fi
    else
      echo "That is not an integer, guess again:"
    fi
  done
}

initialize_game

