#! /bin/bash

PSQL="psql -U postgres -t --no-align --dbname=number_guess"

NUM_RANDOM=$((1 + RANDOM % 1000)) 

echo "Enter your username:"
read USER

CHECK_USER=$($PSQL -c "select username from name where username = '$USER'")

CHECK_PLAYED=$($PSQL -c "select count(*) from game join name on game.id_name = name.id_name where username = '$username';" | xargs)
if [[ -z $CHECK_PLAYED ]]; then
  CHECK_PLAYED=0
fi

CHECK_BEST=$($PSQL -c "select min(guesses) from game join name on game.id_name = name.id_name where username = '$username';" | xargs)
if [[ -z $CHECK_BEST ]]; then
  CHECK_BEST=0
fi

if [[ -z $CHECK_USER ]]; then
  echo "Welcome, $USER! It looks like this is your first time here."
  CHECK_USER=$($PSQL -c "INSERT INTO name(username) VALUES ('$USER');")
  ID_NAME=$($PSQL -c "SELECT id_name FROM name where username = '$USER';" | xargs)
else
  echo "Welcome back, $CHECK_USER You have played $CHECK_PLAYED games, and your best game took $CHECK_BEST guesses."
  ID_NAME=$($PSQL -c "SELECT id_name FROM name where username = '$CHECK_USER';" | xargs)
fi

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
