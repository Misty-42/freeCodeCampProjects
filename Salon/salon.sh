#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ Welcome to Madame Gothel's Fairy Tale Salon ~~~~~"
echo "Which service do you wish for your appointment:"

GET_SERVICE() {
  SERVICE_LIST=$($PSQL "SELECT service_id,name FROM services ORDER BY service_id")
  # display a list of services
  echo "$SERVICE_LIST" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  read SERVICE_ID_SELECTED

  if [ $SERVICE_ID_SELECTED -ge 1 ] && [ $SERVICE_ID_SELECTED -le 6 ]
  then
    SET_APPT
  else
    echo -e "\nWe did not find that service. What do you wish for today?\n"
    GET_SERVICE
  fi
SET_APPT
}

SET_APPT() {
  echo -e "\nPlease provide your phone number (###-###-####):"
  read CUSTOMER_PHONE

  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

  # if customer doesn't exist
  if [[ -z $CUSTOMER_NAME ]]
  then
    # get new customer name
    echo -e "\nAh, New number. Please, what name do you prefer?"
    read CUSTOMER_NAME
    # insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  fi
  CUSTOMER_NAME=$(echo $CUSTOMER_NAME | sed 's/ +//g')
  # get customer_id
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  # get service name
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  # get appointment time
  echo -e "\nWhat time would like for your $SERVICE_NAME?"
  read SERVICE_TIME

  # insert appointment
  INSERT_APPT_RESULT=$($PSQL "INSERT INTO appointments(service_id,customer_id,time) VALUES($SERVICE_ID_SELECTED,$CUSTOMER_ID,'$SERVICE_TIME')")
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  exit
}
GET_SERVICE