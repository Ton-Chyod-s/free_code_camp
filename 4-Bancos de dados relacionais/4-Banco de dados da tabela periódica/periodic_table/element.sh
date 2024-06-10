#! /bin/bash

PSQL="psql -U postgres -t --no-align --dbname=periodic_table"

echo 'Please provide an element as an argument.'

ELEMENT="$1"

if [[ -z $ELEMENT ]]; then
  echo 'No element provided.'
  exit 1
fi

if [[ $ELEMENT =~ [0-118] ]]; then
  QUERY=$($PSQL -c "SELECT * FROM elements WHERE atomic_number = $ELEMENT;")
else
  QUERY=$($PSQL -c "SELECT * FROM elements WHERE symbol = '$ELEMENT';")
fi

echo $QUERY

# echo "The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius."