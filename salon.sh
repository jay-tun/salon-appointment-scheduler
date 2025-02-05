#! /bin/bash 
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ Hip Your Hair Salon ~~~~~\n"

echo -e "\nWelcome to 'Hip Your Hair' Salon, the indipensible place for a great hairdo!!"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "\nBelow you can find the services available here:"
  AVAILABLE_SERVICES=$($PSQL "SELECT * FROM services")
  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done
  
  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in 
  [1-5]) BOOK_SERVICES ;;
  *) MAIN_MENU "Sorry, didn't catch that! Pleas try again.." ;;
  esac
}

BOOK_SERVICES(){
  # get user phone number
  echo -e "\nPlease enter your phone number for scheduling."
  read CUSTOMER_PHONE
  REGISTERED_CUSTOMER=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  CUSTOMER_NAME=$(echo $REGISTERED_CUSTOMER | sed 's/ //g')
  # if a new user
  if [[ -z $REGISTERED_CUSTOMER ]]
  then
    echo -e "\nIt seems you are not registered. Enter your name: "
    read CUSTOMER_NAME
    FORMAT_NAME=$(echo $CUSTOMER_NAME | sed 's/ //g')
    INSERT_NEW_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$FORMAT_NAME', '$CUSTOMER_PHONE')")
  fi
  
  CUSTOMER_ID=$($PSQL "SELECT customer_id from customers WHERE phone='$CUSTOMER_PHONE'")
  GET_SERVICE_NAME=$($PSQL "SELECT name from services WHERE service_id='$SERVICE_ID_SELECTED'")
  SERVICE_NAME=$(echo $GET_SERVICE_NAME | sed -r 's/^ *| *$//g')

  echo -e "\nEnter the time for the appointment."
  read SERVICE_TIME

  INSERT_SERVICE_TIME=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$CUSTOMER_ID', '$SERVICE_ID_SELECTED', '$SERVICE_TIME')")
  if [[ $INSERT_SERVICE_TIME == "INSERT 0 1" ]]
  then
    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi

}

MAIN_MENU