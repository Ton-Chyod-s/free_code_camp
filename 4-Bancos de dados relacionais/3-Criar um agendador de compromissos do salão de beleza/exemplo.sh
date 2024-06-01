#!/bin/bash

# Function to insert a new customer
insert_customer() {
    echo "Enter customer name:"
    read name
    echo "Enter customer phone number:"
    read phone
    service_id=$1
    # Insert the new customer into the customers table
    customer_id=$(psql -d salon -t -c "INSERT INTO customers(service_id, name, phone) VALUES ($service_id, '$name', '$phone') RETURNING customer_id;")
    echo $customer_id
}

# Function to insert a new appointment
insert_appointment() {
    service_id=$1
    customer_id=$2
    echo "Enter appointment name:"
    read name
    echo "Enter appointment time:"
    read time
    # Insert the new appointment into the appointments table
    psql -d salon -c "INSERT INTO appointments(service_id, customer_id, name, time) VALUES ($service_id, $customer_id, '$name', '$time');"
}

# Main script
echo "Enter customer phone number:"
read phone
# Check if the phone number already exists in the customers table
existing_customer=$(psql -d salon -t -c "SELECT customer_id, service_id FROM customers WHERE phone = '$phone';")
if [ -z "$existing_customer" ]; then
    # If the phone number doesn't exist, prompt to insert new customer
    echo "This phone number doesn't exist in the database. Creating a new customer."
    echo "Select service (Enter 1 for cut, 2 for color, 3 for perm, 4 for style, 5 for trim):"
    read service_choice
    # Insert new customer and get customer_id
    customer_id=$(insert_customer $service_choice)
    service_id=$service_choice
else
    # If the phone number exists, extract customer_id and service_id
    customer_id=$(echo $existing_customer | cut -d'|' -f1)
    service_id=$(echo $existing_customer | cut -d'|' -f2)
fi

# Insert appointment using customer_id and service_id
insert_appointment $service_id $customer_id

echo "Appointment created successfully!"
