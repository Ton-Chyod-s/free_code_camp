#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -A -t -c"

SERVICES=$($PSQL "select * from services;")

echo -e "\n~~~~~ MY SALON ~~~~~"

echo -e "\nWelcome to My Salon, how can I help you?\n"

MAIN_MENU() {
  echo "$SERVICES" | while IFS="|" read SERVICE_ID NAME
  do
    SERVICE_ID=$(echo "$SERVICE_ID" | xargs)
    NAME=$(echo "$NAME" | xargs)

    if [[ ! $SERVICE_ID =~ rows && $SERVICE_ID != 'service_id' && $SERVICE_ID != '------------+-------' ]]
    then
      echo "$SERVICE_ID) $NAME"
    fi
  done
  SERVICES_COUNT=$(echo "$SERVICES" | wc -l)

  read MAIN_MENU_SELECTION

  if [[ $MAIN_MENU_SELECTION -gt 0 && $MAIN_MENU_SELECTION -le $SERVICES_COUNT ]]
    then
      RENT_MENU
    else
      echo -e "\nI could not find that service. What would you like today?"
      MAIN_MENU
    fi
  }

RENT_MENU() {
  SERVICE_ID_SELECTED=$($PSQL "select name from services where service_id = $MAIN_MENU_SELECTION")
  SERVICE_ID_SELECTED=$(echo $SERVICE_ID_SELECTED | xargs)

  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_NAME=$($PSQL "select name from customers where phone = '$CUSTOMER_PHONE'")

  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read NEW_NAME
    INSERT_CUSTOMERS=$($PSQL "insert into customers(name, phone) values('$NEW_NAME', '$CUSTOMER_PHONE')")
    echo -e "\nWhat time would you like your $SERVICE_ID_SELECTED, $NEW_NAME?"
    read SERVICE_TIME

    echo -e "\nI have put you down for a $SERVICE_ID_SELECTED at $SERVICE_TIME, $NEW_NAME."

  else 
    echo -e "\nWhat time would you like your $SERVICE_ID_SELECTED, $CUSTOMER_NAME?"

    read SERVICE_TIME

    echo -e "\nI have put you down for a $SERVICE_ID_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."

  fi
}


MAIN_MENU