#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "You are not running as root."
    exit 1
 fi  


    echo "Installing Nginx web server"
    dnf install nginx -y 

    if [ $? -ne 0 ]; then
        echo "Installing Nginx ... Failure"
        exit 1
    else
        echo "Installing Nginx ... Success"
    fi
    echo "Installing MySQL database"
    dnf install mysql -y 
     if [ $? -ne 0 ]; then
        echo "Installing MySQL ... Failure"
        exit 1
    else
        echo "Installing MySQL ... Success"
    fi
    
    echo "Installing Node.js"
    dnf install nodejs -y 
     if [ $? -ne 0 ]; then
        echo "Installing Node.js ... Failure"
        exit 1
    else
        echo "Installing Node.js ... Success"
    fi