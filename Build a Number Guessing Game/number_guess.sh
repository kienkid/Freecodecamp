#!/bin/bash

#play (username, number of guess)
#query on bash 
#gameplayed = count number of row match username
#bestgame = min number of guess match name
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
NUMBER_OF_GUESSES=0
echo -e "~~~Welcome to Number Guessing~~~\n"
echo -n "Enter your username: "

read USERNAME

is_int() {
  [[ $1 =~ ^[0-9]+$ ]]
}

is_old_user() {
  if [[ -z "$($PSQL "SELECT username FROM games WHERE username='$1';")" ]]; then
    echo "Welcome, $1! It looks like this is your first time here."
    QUERY_INSERT=$($PSQL "INSERT INTO games(username, number_of_games, number_of_guesses) VALUES('$1', 0, 10000000);")
  else
    GAMES_PLAYED="$($PSQL "SELECT number_of_games FROM games WHERE username='$1';")"
    BEST_GAME="$($PSQL "SELECT number_of_guesses FROM games WHERE username='$1';")"
    echo "Welcome back, $1! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi
}

random() {
  echo $((1 + $RANDOM % 1000))
}

game() {
  
  read ANSWER
  while true; do
    NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES+1))
    if ! is_int $ANSWER;then
      echo -n "That is not an integer, guess again:"
    elif [[ $ANSWER -gt $1 ]];then
      echo -n "It's lower than that, guess again:"
    elif [[ $ANSWER -lt $1 ]];then
      echo -n "It's higher than that, guess again:"
    elif [[ $ANSWER -eq $1 ]];then
      break
    fi
    read ANSWER
  done
  log_result $USERNAME $NUMBER_OF_GUESSES
  echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET. Nice job!"
}

log_result() {
  NUMBER_OF_GAMES=$(("$($PSQL "SELECT number_of_games FROM games WHERE username='$1';")" + 1))
  if [[ $2 -lt "$($PSQL "SELECT number_of_guesses FROM games WHERE username='$1';")" ]]; then
    QUERY=$($PSQL "UPDATE games SET number_of_guesses=$2, number_of_games=$NUMBER_OF_GAMES WHERE username='$1';")
  else
    QUERY=$($PSQL "UPDATE games SET number_of_games=$NUMBER_OF_GAMES WHERE username='$1';")
  fi
}

main() {
  is_old_user $USERNAME
  SECRET=$(random)
  echo -n "Guess the secret number between 1 and 1000: "
  game $SECRET
}

main

