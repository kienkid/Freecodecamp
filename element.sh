#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

INPUT=$1

is_int() {
  [[ $1 =~ ^[0-9]+$ ]]
}

extract() {
  ELEMENT_NAME="$($PSQL "SELECT name FROM elements WHERE atomic_number='$1';" )"
  ELEMENT_SYMBOL="$($PSQL "SELECT symbol FROM elements WHERE atomic_number='$1';" )"
  TYPE_NO="$($PSQL "SELECT type_id FROM properties WHERE atomic_number='$1';" )"
  TYPE="$($PSQL "SELECT type FROM types WHERE type_id='$TYPE_NO';" )"
  MASS="$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number='$1';" )"
  MELTING="$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number='$1';" )"
  BOILING="$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number='$1';" )"
  echo "The element with atomic number $1 is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $TYPE, with a mass of $MASS amu. $ELEMENT_NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
}

main() {
  if is_int $1; then
    ATOMIC_NO="$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number='$1';" )"
  else
    ATOMIC_NO="$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1';" )$($PSQL "SELECT atomic_number FROM elements WHERE name='$1';" )"
  fi
  
  if [[ -z $ATOMIC_NO ]]; then
    echo "I could not find that element in the database."
  else
    extract $ATOMIC_NO
  fi
}


if [[ -z $INPUT ]]; then
  echo -e "Please provide an element as an argument."
else
  main $INPUT
fi
