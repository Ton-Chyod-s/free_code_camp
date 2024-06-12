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

create table name( id_name serial primary key, username varchar(22) not null, created_at DATE NOT NULL DEFAULT CURRENT_DATE );

create table game( id_game serial primary key, number_of_guesses int not null, guesses int not null, created_at DATE NOT NULL DEFAULT CURRENT_DATE, id_name int not null, foreign key (id_name) references name(id_name));

drop table game;
drop table name;

*/