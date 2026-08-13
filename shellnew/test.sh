#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
	echo "Please run this script with root access"
    exit 1
fi

	echo "Installing... nginx"
	dnf install ngingfhx -y

if [ $? -ne 0 ]; then
	echo "Installation is.... Failure"
else 	
	echo "Installation is.... success"
    fi 