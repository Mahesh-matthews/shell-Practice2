#!/bin/bash
: <<'COMMENT'
Example of if-else statement in bash script= string cant be empty
read -p "Enter your name: " name
if [ -z "$name" ]; then
    echo "Name cannot be empty."
else
    echo "Hello, $name!"
    fi
example of if-else statement in bash script= find the largest number among three numbers

read -p "Enter three numbers: " num1 num2 num3
if [ $num1 -gt $num2 ] && [ $num1 -gt $num3 ]; then
    echo "$num1 is the largest number."
elif [ $num2 -gt $num1 ] && [ $num2 -gt $num3 ]; then
    echo "$num2 is the largest number."
else
    echo "$num3 is the largest number."
fi 


NUM=$1
if [ $NUM -gt 20 ]; then
    echo "given number is greater than 20."
elif [ $NUM -eq 20 ]; then
    echo "given number is equal to 20."
else
    echo "given number is less than 20."
fi   
COMMENT

USERID=$(id -u)
if [ $USERID -ne 0 ]; then
    echo "You are not running as root."
    exit 1
 fi  


    echo "Installing Nginx web server"
    dnf install nginx -y 

    if [ $? -ne 0 ]; then
        echo "Installing Nginx ... Failure"
    else
        echo "Installing Nginx ... Success"
    fi
