#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    # query for element by atomic number and return name,symbol, type, and properties
    ELEMENT_INFO=$($PSQL "SELECT atomic_number,name,symbol,type,atomic_mass,melting_point_celsius,boiling_point_celsius FROM elements as e INNER JOIN properties as p USING(atomic_number) INNER JOIN types as t USING(type_id) WHERE atomic_number = $1")
    NUMBER=$1
  else
    # query for element by symbol and return name,symbol, type, and properties
    ELEMENT_INFO=$($PSQL "SELECT atomic_number,name,symbol,type,atomic_mass,melting_point_celsius,boiling_point_celsius FROM elements as e INNER JOIN properties as p USING(atomic_number) INNER JOIN types as t USING(type_id) WHERE symbol = '$1'")   
    if [[ -z $ELEMENT_INFO ]]
    then
      # query for element by name and return name,symbol, type, and properties
      ELEMENT_INFO=$($PSQL "SELECT atomic_number,name,symbol,type,atomic_mass,melting_point_celsius,boiling_point_celsius FROM elements as e INNER JOIN properties as p USING(atomic_number) INNER JOIN types as t USING(type_id) WHERE name = '$1'")

    fi
  fi
  if [[ -z $ELEMENT_INFO ]]
  then
    echo "I could not find that element in the database."
  else  
    echo "$ELEMENT_INFO" | while read NUMBER BAR NAME BAR SYMBOL BAR TYPE BAR MASS BAR MELTING BAR BOILING
    do
      # display element info
      echo "The element with atomic number $NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    done
  fi
fi
