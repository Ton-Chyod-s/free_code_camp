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
    ATOMIC_NUMBER=$($PSQL -c "SELECT atomic_number FROM elements WHERE symbol = '$ELEMENT';")
  
    if [[ -z $ATOMIC_NUMBER || $ATOMIC_NUMBER =~ ^[[:space:]]*$ ]]; then
      ATOMIC_NUMBER=$($PSQL -c "SELECT atomic_number FROM elements WHERE name = '$ELEMENT';")

    fi

  fi

  echo $ATOMIC_NUMBER

  NAME_ELEMENT=$($PSQL -c "select name from elements where atomic_number = $ATOMIC_NUMBER")
  SYMBOL_ELEMENT=$($PSQL -c "select symbol from elements where atomic_number = $ATOMIC_NUMBER")
  TYPE_ELEMENT=$($PSQL -c "select type from properties where atomic_number = $ATOMIC_NUMBER")
  ATOMIC_MASS=$($PSQL -c "select atomic_mass from properties where atomic_number = $ATOMIC_NUMBER")
  MELTING_CELSIUS=$($PSQL -c "select melting_point_celsius from properties where atomic_number = $ATOMIC_NUMBER")
  BOILING_CELSIUS=$($PSQL -c "select boiling_point_celsius from properties where atomic_number = $ATOMIC_NUMBER")

  echo "The element with atomic number $ATOMIC_NUMBER is $NAME_ELEMENT ($SYMBOL_ELEMENT). It's a $TYPE_ELEMENT, with a mass of $ATOMIC_MASS amu. $NAME_ELEMENT has a melting point of $MELTING_CELSIUS celsius and a boiling point of $BOILING_CELSIUS celsius."
fi

