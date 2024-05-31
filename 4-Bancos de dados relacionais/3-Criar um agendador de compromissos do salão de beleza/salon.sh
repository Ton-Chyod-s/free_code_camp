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
  SELECT_SERVICE=$($PSQL "select name from services where service_id = $MAIN_MENU_SELECTION")
  SELECT_SERVICE=$(echo $SELECT_SERVICE | xargs)

  echo -e "\nWhat's your phone number?"
  read PHONE

  EXIST_NAME=$($PSQL "select name from customers where phone = '$PHONE'")

  if [[ -z $EXIST_NAME ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read NEW_NAME
    INSERT_CUSTOMERS=$($PSQL "insert into customers(name) values('$NEW_NAME')")
  fi

  if [[ -z $EXIST_NAME ]]
  then
    echo -e "\nWhat time would you like your $SELECT_SERVICE, $NEW_NAME?"
  else 
    echo -e "\nWhat time would you like your $SELECT_SERVICE, $EXIST_NAME?"
  fi
  read TIME

}


MAIN_MENU