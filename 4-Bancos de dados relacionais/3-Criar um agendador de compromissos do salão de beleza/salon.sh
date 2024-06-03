#! /bin/bash

#PSQL="psql --username=freecodecamp --dbname=salon -A -t -c"
PSQL="psql -U postgres -t --no-align --dbname=salon"

#SERVICES=$($PSQL "select * from services;")
SERVICES=$($PSQL -c "select * from services;")

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
  SERVICE_NAME_SELECTED=$($PSQL -c "select name from services where service_id = $MAIN_MENU_SELECTION")
  SERVICE_NAME_SELECTED=$(echo $SERVICE_NAME_SELECTED | xargs)

  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_NAME=$($PSQL -c "select name from customers where phone = '$CUSTOMER_PHONE'")

  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    
    SERVICE_ID_SELECTED=$($PSQL -c "select service_id from services where name = '$SERVICE_NAME_SELECTED'")
    SERVICE_ID_SELECTED=$(echo $SERVICE_ID_SELECTED | xargs)


    INSERT_CUSTOMERS=$($PSQL -c "insert into customers(service_id, name, phone) values($SERVICE_ID_SELECTED ,'$CUSTOMER_NAME', '$CUSTOMER_PHONE')")

    echo -e "\nWhat time would you like your $SERVICE_NAME_SELECTED, $CUSTOMER_NAME?"
    read SERVICE_TIME

    echo -e "\nI have put you down for a $SERVICE_NAME_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."

  else
    SERVICE_ID_SELECTED=$($PSQL -c "select service_id from services where name = '$SERVICE_NAME_SELECTED'")
    SERVICE_ID_SELECTED=$(echo $SERVICE_ID_SELECTED | xargs)
    
    echo -e "\nWhat time would you like your $SERVICE_NAME_SELECTED, $CUSTOMER_NAME?"

    read SERVICE_TIME

    INSERT_CUSTOMERS=$($PSQL -c "insert into customers(service_id, name, phone) values($SERVICE_ID_SELECTED ,'$CUSTOMER_NAME', '$CUSTOMER_PHONE')")

    echo -e "\nI have put you down for a $SERVICE_NAME_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."

  fi
  SELECT_CUSTOMERS_ID=$($PSQL -c "select customer_id from customers where phone = '$CUSTOMER_PHONE'")
 

  #INSERT_APPOINTMENTS=$($PSQL "insert into appointments(customer_id,service_id,name,time) values($SELECT_CUSTOMERS_ID,$SELECT_SERVICES_ID,'$CUSTOMER_NAME','$SERVICE_TIME');") 
}


MAIN_MENU