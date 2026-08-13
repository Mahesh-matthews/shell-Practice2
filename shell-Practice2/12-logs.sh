#!/bin/bash

# Logs and redirecting output to log file
USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-scripting"
LOGS_FILE="/var/log/shell-scripting/$0.log"
if [ $USERID -ne 0 ]; then
    echo "You are not running as root." | tee -a $LOGS_FILE
    exit 1
 fi  

 mkdir -p $LOGS_FOLDER

   validate(){

    if [ $1 -ne 0 ]; then
        echo "$2 ... Failure" | tee -a $LOGS_FILE
        exit 1
    else
        echo "$2 ... Success" | tee -a $LOGS_FILE
    fi

   }

   
    dnf install nginx -y &>> $LOGS_FILE
    validate $? "Installing Nginx"
  
    dnf install mysql -y &>> $LOGS_FILE
    validate $? "Installing MySQL"

    dnf install nodejs -y &>> $LOGS_FILE
    validate $? "Installing Node.js"
