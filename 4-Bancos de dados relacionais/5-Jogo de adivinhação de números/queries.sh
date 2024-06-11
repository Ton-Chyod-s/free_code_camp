#! /bin/bash

PSQL="psql -U postgres -t --no-align --dbname=number_guess"

NUM_RANDOM=$((RANDOM % 1000 + 1))

echo "Enter your username:"
read NAME

ID_NAME=$($PSQL -c "SELECT id_name FROM name WHERE nome = '$NAME';")

if [[ -z $ID_NAME ]]; then
  echo "Welcome, $NAME! It looks like this is your first time here."
  INSERT_NAME=$($PSQL -c "insert into name(nome) values ('$NAME');")
else
  GAMES_PLAYED=$($PSQL -c "SELECT count(tentativa) FROM game WHERE id_name = $ID_NAME;")

  BEST_GAME=$($PSQL -c "SELECT max(tentativa) FROM game WHERE id_name = $ID_NAME;")

  echo "Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."

fi

echo -e "\nGuess the secret number between 1 and 1000:"
read SECRET_NUMBER

# echo "You guessed it in <number_of_guesses> tries. The secret number was <secret_number>. Nice job!"

if [[ $ELEMENT =~ ^(0|[1-9][0-9]?|1[01][0-8])$ ]]; then
  if [[ $SECRET_NUMBER -eq $NUM_RANDOM ]]; then
      echo "It's lower than that, guess again:"
  else
      echo "It's higher than that, guess again:"
  fi
else
  echo "That is not an integer, guess again:"
fi
