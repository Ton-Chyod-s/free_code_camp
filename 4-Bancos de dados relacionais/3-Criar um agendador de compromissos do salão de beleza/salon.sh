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

  read SERVICE_ID_SELECTED

  VALID_SERVICE=$($PSQL -c "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED;")

  if [[ -z $VALID_SERVICE ]]
  then
  echo -e "\nI could not find that service. What would you like today?"
  MAIN_MENU
  else
    RENT_MENU $SERVICE_ID_SELECTED
  fi
}

RENT_MENU() {
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    CUSTOMER_NAME=$($PSQL -c "select name from customers where phone = '$CUSTOMER_PHONE';")

    local selection=$1
    local SERVICE_ID_SELECTED=$(echo "$SERVICES" | awk -F"|" -v sel="$selection" '$1 == sel {print $1}')
    local SERVICE_NAME_SELECTED=$(echo "$SERVICES" | awk -F"|" -v sel="$selection" '$1 == sel {print $2}')

    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME

      INSERT_CUSTOMER=$($PSQL -c "INSERT INTO customers(name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE');")
    fi

    echo -e "\nWhat time would you like your $SERVICE_NAME_SELECTED, $CUSTOMER_NAME?"
    read SERVICE_TIME

    SERVICE_ID_CUSTOMERS=$($PSQL -c "select customer_id from customers where phone = '$CUSTOMER_PHONE'")
    
    INSERT_APPOIMENTS=$($PSQL -c "insert into appointments(customer_id,service_id,name,time) values($SERVICE_ID_CUSTOMERS, $SERVICE_ID_SELECTED, '$CUSTOMER_NAME', '$SERVICE_TIME')")

    echo "I have put you down for a $SERVICE_NAME_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."
}

MAIN_MENU