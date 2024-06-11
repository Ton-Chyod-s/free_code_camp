#! /bin/bash

PSQL="psql -U postgres -t --no-align --dbname=periodic_table"

NUM_RANDOM=$RANDOM

echo "Enter your username:"
read name