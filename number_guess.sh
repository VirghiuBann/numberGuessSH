#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

GENERATE_RANDOM_NUMBER() {
  RANDOM_NUMBER=$(($RANDOM % 1000 + 1))
  echo "$RANDOM_NUMBER"
}

 # get user from databse
GET_USERNAME() {
  local QUERY="SELECT * FROM users WHERE username='$1'"
  $PSQL "$QUERY"
}


MAIN() {
  echo Enter your username:
  read USERNAME

 local GET_USER=$(GET_USERNAME "$USERNAME")  

  if [[ -z $GET_USER ]]
  then
    echo Welcome, $USERNAME! It looks like this is your first time here.
  else
    echo Welcome back, $USERNAME
  fi

}

MAIN