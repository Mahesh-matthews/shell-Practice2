#!/bin/bash

# Logs and redirecting output to log file
USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-scripting"
LOGS_FILE="/var/log/shell-scripting/$0.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
N="\e[0m"



if [ $USERID -ne 0 ]; then
    echo -e "$R You are not running as root.$N" | tee -a $LOGS_FILE
    exit 1
 fi  



 mkdir -p $LOGS_FOLDER

   validate(){

    if [ $1 -ne 0 ]; then
        echo -e "$R $2 ... Failure$N" | tee -a $LOGS_FILE
        exit 1
    else
        echo -e "$G $2 ... Success$N" | tee -a $LOGS_FILE
    fi

   }

   for package in $@ #sudo sh 14-loops.sh nginx mysql nodejs
   do 
    dnf list installed $package &>> $LOGS_FILE
    if [ $? -ne 0 ]; then
        echo -e "$Y $package is not installed. Installing $package$N" | tee -a $LOGS_FILE
        dnf install $package -y &>> $LOGS_FILE
        validate $? "Installing $package"
    else
        echo -e "$B $package is already installed. Skipping $package$N" | tee -a $LOGS_FILE
    fi
    done
