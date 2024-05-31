#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -c"

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
  SERVICES_COUNT=$(($(echo "$SERVICES" | wc -l) - 3))

  read MAIN_MENU_SELECTION


  if [[ $MAIN_MENU_SELECTION -gt 0 && $MAIN_MENU_SELECTION -le $SERVICES_COUNT ]]
    then
      echo "You selected service ID: $MAIN_MENU_SELECTION"
    else
      echo -e "\nI could not find that service. What would you like today?"
      MAIN_MENU
    fi



  # # Validate user input
  # if [[ $MAIN_MENU_SELECTION -gt $SERVICES_COUNT ]]
  # then
  #   echo -e "\nI could not find that service. What would you like today?"
  #   MAIN_MENU
  # else
  #   echo -e "\nWhat's your phone number?"
  #   read PHONE

  #   EXIST_PHONE=$($PSQL "select name from customers where phone = $PHONE")
  #   if [[ ! -z $EXIST_PHONE ]]
  #   then
  #     echo -e "\nWhat time would you like your cut, Fabio?"
  #     read TIME
  #   else
  #     echo -e "\nI don't have a record for that phone number, what's your name?"
  #     read NEW_NAME
  #   fi


  
  }


MAIN_MENU