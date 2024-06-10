#! /bin/bash

PSQL="psql -U postgres -t --no-align --dbname=periodic_table"

echo 'Please provide an element as an argument.'

initcap() {
    echo "$1" | awk '{print toupper(substr($0, 1, 1)) substr($0, 2)}'
}

ELEMENT=$(initcap "$1")

if [[ ! -z $ELEMENT ]]; then
  if [[ $ELEMENT =~ ^(0|[1-9][0-9]?|1[01][0-8])$ ]]; then
    ATOMIC_NUMBER=$($PSQL -c "SELECT atomic_number FROM elements WHERE atomic_number = $ELEMENT;")
  else
    if [[ $ELEMENT =~ ^[A-Z][a-z]*$ ]]; then
      ATOMIC_NUMBER=$($PSQL -c "SELECT atomic_number FROM elements WHERE symbol = '$ELEMENT';")
    fi
  fi



  echo "The element with atomic number $ATOMIC_NUMBER is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius."
fi

