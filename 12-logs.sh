#!/bin/bash
USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-scripting"
LOGS_FILE="/var/log/shell-scripting/$0.log"
if [ $USERID -ne 0 ]; then
    echo "You are not running as root."
    exit 1
 fi  

 mkdir -p $LOGS_FOLDER

   validate(){

    if [ $1 -ne 0 ]; then
        echo "$2 ... Failure"
        exit 1
    else
        echo "$2 ... Success"
    fi

   }

    echo "Installing Nginx web server"
    dnf install nginx -y &>> $LOGS_FILE
    validate $? "Installing Nginx"
    echo "Installing MySQL database"
    dnf install mysql -y &>> $LOGS_FILE
    validate $? "Installing MySQL"
    echo "Installing Node.js"
    dnf install nodejs -y &>> $LOGS_FILE
    validate $? "Installing Node.js"
