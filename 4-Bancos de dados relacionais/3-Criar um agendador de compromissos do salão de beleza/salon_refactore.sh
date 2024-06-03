#! /bin/bash

#PSQL="psql --username=freecodecamp --dbname=salon -A -t -c"
PSQL="psql -U postgres -t --no-align --dbname=salon"

SERVICES=$($PSQL -c "select * from services;")

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
      insert_data $MAIN_MENU_SELECTION
    else
      echo -e "\nI could not find that service. What would you like today?"
      MAIN_MENU
    fi
}

insert_data() {
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    CUSTOMER_NAME=$($PSQL -c "select name from customers where phone = '$CUSTOMER_PHONE';")
    echo $CUSTOMER_NAME

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

    if [[ -z $CUSTOMER_NAME ]]
    then
      INSERT_CUSTOMER=$($PSQL -c "INSERT INTO customers(service_id, name, phone) VALUES ($SERVICE_ID_SELECTED, '$CUSTOMER_NAME', '$CUSTOMER_PHONE');")
    fi 

    SERVICE_ID_CUSTOMERS=$($PSQL -c "select customer_id from customers where phone = '$CUSTOMER_PHONE'")
    
    INSERT_APPOIMENTS=$($PSQL -c "insert into appointments(customer_id,service_id,name,time) values($SERVICE_ID_CUSTOMERS, $SERVICE_ID_SELECTED, '$CUSTOMER_NAME', '$CUSTOMER_PHONE')")

}

MAIN_MENU
