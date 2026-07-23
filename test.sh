#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
	echo "Please run this script with root access"
    exit 1
fi

	echo "Installing... nginx"
	dnf install nginx -y

if [ $? -eq 0 ]; then
	echo "Installation is.... Success"
else 	
	echo "Installation is.... Failure"
    fi 