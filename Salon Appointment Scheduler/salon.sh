#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"

echo "$($PSQL "SELECT CONCAT(service_id, ') ', name) FROM services;" )" 

validService() {
  read SERVICE_ID_SELECTED

  if [[ -z "$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED;" )" ]]; then
    echo -e "\nI could not find that service. What would you like today?"
    echo "$($PSQL "SELECT CONCAT(service_id, ') ', name) FROM services;" )" 
    validService
  else
    VALIDSVC=$SERVICE_ID_SELECTED
  fi
}

checkPhone() {
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  if [[ -z "$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';" )" ]]; then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    $PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME');"
  else
    CUSTOMER_NAME="$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';" )"
  fi
}

bookTime() {
  SERVICE_NAME="$($PSQL "SELECT name FROM services WHERE service_id=$VALIDSVC;")"
  CUSTOMER_ID="$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")"
  echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME"
  read SERVICE_TIME
  $PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$CUSTOMER_ID', '$VALIDSVC', '$SERVICE_TIME');"
  echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}

main() {
validService
checkPhone
bookTime
}

main
