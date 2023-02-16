#!/bin/bash

# Number Guessing Game
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

ATTEMPTS=0

# Collect username
echo "Enter your username:"
read USERNAME

# check if user already exists
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

# if user doesn't exist
if [[ -z $USER_ID ]]
then
  # insert new user
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  if [[ $INSERT_USER_RESULT == 'INSERT 0 1' ]]
  then
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  else
    exit
  fi
else
  GAMES_PLAYED=$($PSQL "SELECT count(game_id) FROM games WHERE user_id=$USER_ID")
  BEST_GAMES=$($PSQL "SELECT min(attempts) FROM games WHERE user_id=$USER_ID")
  echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAMES guesses. "
fi

# Number Generator
NUMBER=$(( 1 + RANDOM % 1000 ))

echo -e "Guess the secret number between 1 and 1000:"
read GUESS

while :
do
  ((ATTEMPTS++))
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo -e "\nThat is not an integer, guess again:"
    read GUESS
  elif [[ $GUESS -lt $NUMBER ]]
  then
    echo -e "\nIt's higher than that, guess again:"
    read GUESS
  elif [[ $GUESS -gt $NUMBER ]]
  then
    echo -e "\nIt's lower than that, guess again:"
    read GUESS
  else
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id,attempts) VALUES($USER_ID,$ATTEMPTS)")
    if [[ $INSERT_GAME_RESULT == 'INSERT 0 1' ]]
    then
      echo -e "\nYou guessed it in $ATTEMPTS tries. The secret number was $NUMBER. Nice job!"
      exit
    else
      echo -e "\nThere was an error collecting your game information. Please play again."
      exit
    fi
  fi
done