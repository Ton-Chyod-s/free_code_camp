#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -A -t -c"

SERVICES=$($PSQL "select * from services;")

echo -e "\n~~~~~ MY SALON ~~~~~"

echo -e "\nWelcome to My Salon, how can I help you?\n"

MAIN_MENU() {
  echo "$SERVICES" | while IFS="|" read SERVICE_ID NAME
  do
    local service_id=$(echo "$SERVICE_ID" | xargs)
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
      insert_customer $MAIN_MENU_SELECTION
    else
      echo -e "\nI could not find that service. What would you like today?"
      MAIN_MENU
    fi
}

insert_customer() {
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    CUSTOMER_NAME=$($PSQL "select name from customers where phone = '$CUSTOMER_PHONE';")

    local selection=$1
    local SERVICE_ID_SELECTED=$(echo "$SERVICES" | awk -F"|" -v sel="$selection" '$1 == sel {print $1}')
    local SERVICE_NAME_SELECTED=$(echo "$SERVICES" | awk -F"|" -v sel="$selection" '$1 == sel {print $2}')

    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
    fi

    echo -e "\nWhat time would you like your $SERVICE_NAME_SELECTED, $CUSTOMER_NAME?"
    read SERVICE_TIME
   
    customer_id=$($PSQL "INSERT INTO customers(service_id, name, phone, service_time) VALUES ($SERVICE_ID_SELECTED, '$CUSTOMER_NAME', '$CUSTOMER_PHONE', '$SERVICE_TIME') RETURNING customer_id;")
    
}

MAIN_MENU
