#! /bin/bash

PSQL="psql -U postgres -t --no-align --dbname=number_guess"

NUM_RANDOM=$RANDOM

echo "Enter your username:"
read NAME

echo "Welcome back, $NAME! You have played <games_played> games, and your best game took <best_game> guesses."

echo "Welcome, $NAME! It looks like this is your first time here."

echo "Guess the secret number between 1 and 1000:"

echo "It's lower than that, guess again:"

echo "It's higher than that, guess again:"

echo "That is not an integer, guess again:"

echo "You guessed it in <number_of_guesses> tries. The secret number was <secret_number>. Nice job!"