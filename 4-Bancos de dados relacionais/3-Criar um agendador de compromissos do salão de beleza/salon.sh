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
  SERVICES_LEN=${#SERVICES}

  read MAIN_MENU_SELECTION

  if [[ $MAIN_MENU_SELECTION > $SERVICES_LEN ]]
  then
    case $MAIN_MENU_SELECTION in
      1) RENT_MENU ;;
      2) RETURN_MENU ;;
      3) EXIT ;;
    esac
    
  else
    echo -e "\nI could not find that service. What would you like today?"
    MAIN_MENU
  fi

}


RENT_MENU(){
  echo
}


RETURN_MENU(){
  echo 
}


EXIT() {
  echo -e "\nThank you for stopping in.\n"
}

MAIN_MENU