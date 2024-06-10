#! /bin/bash

PSQL="psql -U postgres -t --no-align --dbname=periodic_table"

ELEMENT=$(initcap "$1")