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

   for package in $@ #sudo sh 14-loops.sh nginx mysql nodejs
   do 

    dnf install $package -y &>> $LOGS_FILE
    validate $? "Installing $package"
   done
