#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

 # get user_id
GET_USER_ID() {
  local QUERY="SELECT user_id FROM users WHERE username='$1'"
  $PSQL "$QUERY"
}

#create an user
CREATE_USER() {
  local QUERY="INSERT INTO users(username) VALUES('$1')"
  $PSQL "$QUERY"
}

#insert number of guesses
INSERT_GUESS() {
  local USER_ID=$1
  local NUMBER_OF_GUESSES=$2
  local QUERY="INSERT INTO guesses(user_id, number_of_guesses) VALUES($USER_ID, $NUMBER_OF_GUESSES)"
  $PSQL "$QUERY"
}

GET_USER_GUESSES_DETAIL() {
  local USER_ID=$1
  local USERNAME=$2  

  local GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM users INNER JOIN guesses USING(user_id) WHERE user_id=$USER_ID")
  local BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM users INNER JOIN guesses USING(user_id) WHERE user_id=$USER_ID")
  
  printf "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
}

MAIN() {
  echo -e "\nEnter your username:"
  read -r USERNAME

 local USER_ID=$(GET_USER_ID "$USERNAME")  

  if [[ -z $USER_ID ]]
  then
    printf "\nWelcome, $USERNAME! It looks like this is your first time here."
    CREATE_USER_RESULT=$(CREATE_USER "$USERNAME")   
    USER_ID=$(GET_USER_ID "$USERNAME")
  else
    GET_USER_GUESSES_DETAIL "$USER_ID" "$USERNAME"
  fi

  #generate secret number guess
  SECRET_NUMBER_GUESS=$(( RANDOM % 1000 + 1 ))
  
  echo -e "\nGuess the secret number between 1 and 1000:" 
  
  #conuter guesses
  NUMBER_TRIES=0

  while true
  do         
    read -r USER_NUMBER_GUESS
    
    if [[ ! $USER_NUMBER_GUESS =~ ^[0-9]+$ ]]
    then
      echo -e "\nThat is not an integer, guess again:"
    else
      ((NUMBER_TRIES++)) 
    
      if [[ $USER_NUMBER_GUESS -eq $SECRET_NUMBER_GUESS  ]]
      then
        INSERT_GUESS_RESULT=$(INSERT_GUESS "$USER_ID" "$NUMBER_TRIES")
        
        echo -e "\nYou guessed it in $NUMBER_TRIES tries. The secret number was $SECRET_NUMBER_GUESS. Nice job!"
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