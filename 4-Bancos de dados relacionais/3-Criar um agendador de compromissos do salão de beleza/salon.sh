#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -c"

SERVICES=$($PSQL "select * from services;")

echo -e "\n~~~~~ MY SALON ~~~~~"

MAIN_MENU() {

  echo -e "\nWelcome to My Salon, how can I help you?\n"

  echo "$SERVICES" | while IFS="|" read SERVICE_ID NAME
  do
    SERVICE_ID=$(echo "$SERVICE_ID" | xargs)
    NAME=$(echo "$NAME" | xargs)

    if [[ ! $SERVICE_ID =~ rows && $SERVICE_ID != 'service_id' && $SERVICE_ID != '------------+-------' ]]
    then
      echo "$SERVICE_ID) $NAME"
    fi
  done
  read MAIN_MENU_SELECTION

  case $MAIN_MENU_SELECTION in
    1) RENT_MENU ;;
    2) RETURN_MENU ;;
    3) EXIT ;;
    *) MAIN_MENU "I could not find that service. What would you like today?" ;;
  esac
}


RENT_MENU(){
  
  echo SERVICES_LEN=${#SERVICES}

  if [[ $MAIN_MENU_SELECTION > $SERVICES_LEN ]]
  then
    echo 
  fi
}


RETURN_MENU(){
  echo 
}


EXIT() {
  echo -e "\nThank you for stopping in.\n"
}

MAIN_MENU