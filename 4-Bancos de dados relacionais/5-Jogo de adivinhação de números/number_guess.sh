#! /bin/bash

PSQL="psql -U postgres -t --no-align --dbname=number_guess"

NUM_RANDOM=$((1 + RANDOM % 1000)) 
echo "Enter your username:"
read username

declare -i number_of_guesses=0

CHECK_NAME=$($PSQL -c "SELECT username FROM name WHERE username = '$username';" | xargs)

if [[ ! -z $CHECK_NAME ]]; then
  games_played=$($PSQL -c "select count(*) from game join name on game.id_name = name.id_name where username = '$username';" | xargs)
  if [[ -z $games_played ]]; then
    games_played=0
  fi

  best_game=$($PSQL -c "select min(guesses) from game join name on game.id_name = name.id_name where username = '$username';" | xargs)
  if [[ -z $best_game ]]; then
    best_game=0
  fi
  echo "Welcome back, $CHECK_NAME! You have played $games_played games, and your best game took $best_game guesses."
else
  echo "Welcome, $username! It looks like this is your first time here."
  INSERT_NAME=$($PSQL -c "INSERT INTO name(username) VALUES ('$username');")
fi

ID_NAME=$($PSQL -c "SELECT id_name FROM name WHERE username = '$username';" | xargs)

while true; do
  echo $NUM_RANDOM 
  echo "Guess the secret number between 1 and 1000:"
  read secret_number
  
  if [[ $secret_number =~ ^[0-9]+$ ]]; then
    ((number_of_guesses++))
    if (( secret_number > NUM_RANDOM )); then
      echo "It's higher than that, guess again:"
    elif (( secret_number < NUM_RANDOM )); then
      echo "It's lower than that, guess again:"
    else
      INSERT_GAME=$($PSQL -c "INSERT INTO game( number_of_guesses, guesses, id_name) VALUES ( $secret_number, $number_of_guesses, $ID_NAME);")
      break
    fi
  else
    echo "That is not an integer, guess again:"
  fi
done

echo -e "\nYou guessed it in $number_of_guesses tries. The secret number was $NUM_RANDOM. Nice job!\n"
