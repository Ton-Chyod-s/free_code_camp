/*

mkdir number_guessing_game

cd number_guessing_game

touch number_guess.sh

chmod +x number_guess.sh

git init 

git add .

git commit -m "Initial commit"

echo "#! /bin/bash" > number_guess.sh

git branch -M main

git add .

git commit -m "feat: start game"

psql -U postgres

create database number_guess; 

\c number_guess

create table name( id_name serial primary key, nome varchar(22) not null, created_at timestamp not null default current_timestamp );

create table game( id_game serial primary key, numero int not null, tentativa int not null, created_at timestamp not null default current_timestamp, id_name int not null, foreign key (id_name) references name(id_name));

drop table game;
drop table name;

*/




/*

If that username has been used before, it should print Welcome back, <username>! You have played <games_played> games, and your best game took <best_game> guesses., with <username> being a users name from the database, <games_played> being the total number of games that user has played, and <best_game> being the fewest number of guesses it took that user to win the game


When the secret number is guessed, your script should print You guessed it in <number_of_guesses> tries. The secret number was <secret_number>. Nice job! and finish running

*/