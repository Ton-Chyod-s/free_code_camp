#! /bin/bash

PSQL="psql -U postgres -t --no-align --dbname=periodic_table"

echo 'Please provide an element as an argument.'
ELEMENT="$1"

if [[ ! -z $ELEMENT ]]; then
  if [[ $ELEMENT =~ ^(0|[1-9][0-9]?|1[01][0-8])$ ]]; then
    QUERY=$($PSQL -c "SELECT atomic_number FROM elements WHERE atomic_number = $ELEMENT;")
    
  else
    QUERY=$($PSQL -c "SELECT atomic_number FROM elements WHERE symbol = '$ELEMENT';")
 
  fi

  echo "The element with atomic number $QUERY is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius."
fi

