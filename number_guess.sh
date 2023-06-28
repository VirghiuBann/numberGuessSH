#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

GENERATE_RANDOM_NUMBER() {
  RANDOM_NUMBER=$(($RANDOM % 1000 + 1))
  echo "$RANDOM_NUMBER"
}

 # get user from databse
GET_USER_ID() {
  local QUERY="SELECT user_id FROM users WHERE username='$1'"
  $PSQL "$QUERY"
}

#create an user
CREATE_USER() {
  local QUERY="INSERT INTO users(username) VALUES('$1')"
  $PSQL "$QUERY"
}

#insert a guess
INSERT_GUESS() {
  local USER_ID=$1
  local NUMBER_OF_GUESSES=$2
  local QUERY="INSERT INTO guesses(user_id, number_of_guesses) VALUES($USER_ID, $NUMBER_OF_GUESSES)"
  $PSQL "$QUERY"
}

GET_USER_GUESSES_DETAIL() {
  local USER_ID=$1
  local USERNAME=$2  

  local GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM guesses WHERE user_id=$USER_ID")
  local BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM guesses WHERE user_id=$USER_ID")
  
  echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
}


MAIN() {
  echo -e "\nEnter your username:"
  read -r USERNAME

 local USER_ID=$(GET_USER_ID "$USERNAME")  

  if [[ -z $USER_ID ]]
  then
    echo -e "Welcome, $USERNAME! It looks like this is your first time here."
    CREATE_USER_RESULT=$(CREATE_USER "$USERNAME")   
    USER_ID=$(GET_USER_ID "$USERNAME")
  else
    GET_USER_GUESSES_DETAIL "$USER_ID" "$USERNAME"
  fi

  SECRET_NUMBER_GUESS=$(GENERATE_RANDOM_NUMBER)
  echo "Guess the secret number between 1 and 1000:" 
  # try conuter guesses
  NUMBER_TRIES=0

  while true
  do         
    read -r USER_NUMBER_GUESS
    
    if [[ ! $USER_NUMBER_GUESS =~ ^[0-9]+$ ]]
    then
      echo "That is not an integer, guess again:"
    else
      NUMBER_TRIES=$((NUMBER_TRIES + 1)) 
    
      if [[ $USER_NUMBER_GUESS -eq $SECRET_NUMBER_GUESS  ]]
      then
        INSERT_GUESS_RESULT=$(INSERT_GUESS "$USER_ID" "$NUMBER_TRIES")
        
        echo -e "You guessed it in $NUMBER_TRIES tries. The secret number was $SECRET_NUMBER_GUESS. Nice job!"
        break
      elif [[ $USER_NUMBER_GUESS -gt $SECRET_NUMBER_GUESS  ]]
      then 
        echo "It's higher than that, guess again:"
      else
        echo "It's lower than that, guess again:"
      fi      
    fi
  done
}

MAIN