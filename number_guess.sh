#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

GENERATE_RANDOM_NUMBER() {
  RANDOM_NUMBER=$(($RANDOM % 1000 + 1))
  echo "$RANDOM_NUMBER"
}
