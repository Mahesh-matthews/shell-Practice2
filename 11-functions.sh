#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "You are not running as root."
    exit 1
 fi  

   validate(){

    if [ $1 -ne 0 ]; then
        echo "$2 ... Failure"
        exit 1
    else
        echo "$2 ... Success"
    fi

   }

    echo "Installing Nginx web server"
    dnf install nginx -y 
    validate $? "Installing Nginx"
    echo "Installing MySQL database"
    dnf install mysql -y 
    validate $? "Installing MySQL"
    echo "Installing Node.js"
    dnf install nodejs -y 
    validate $? "Installing Node.js"