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
    local selection=$1
    local service_id=$(echo "$SERVICES" | awk -F"|" -v sel="$selection" '$1 == sel {print $1}')
    echo "Enter customer name:"
    read name
    echo "Enter customer phone number:"
    read phone
    # Insert the new customer into the customers table
    customer_id=$($PSQL "INSERT INTO customers(service_id, name, phone) VALUES ($service_id, '$name', '$phone') RETURNING customer_id;")
}

MAIN_MENU
