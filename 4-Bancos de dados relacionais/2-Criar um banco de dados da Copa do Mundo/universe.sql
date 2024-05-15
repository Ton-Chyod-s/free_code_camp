/* 
chmod +x queries.sh
chmod +x insert_data.sh

./queries.sh
./insert_data.sh

psql --username=freecodecamp --dbname=postgres

create database worldcup;
\c worldcup

create table teams();
create table games();

alter table teams add column team_id serial primary key;

alter table teams add column name varchar(50) not null unique;

alter table games add column game_id serial primary key;

alter table games add column year int;

alter table games add column round varchar;



*/