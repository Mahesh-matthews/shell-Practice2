#!/bin/bash
#-----------------------------------------------------------
# Shell Script 09 - Using If, Elif, and Else Statements
# Script Name : if_else_conditions.sh
# Purpose     : Demonstrate the use of conditional statements
#               (if, elif, else) in Bash scripting.
#
# Usage       : ./if_else_conditions.sh <number>
# Example     : ./if_else_conditions.sh 25
#-----------------------------------------------------------

# The ':' command is a built-in Bash command that does nothing.
# It is commonly used with a here-document (<<) to create
# multi-line comments in Bash scripts.
#
# Everything between <<'COMMENT' and COMMENT is ignored by Bash.

: <<'COMMENT'

-----------------------------------------------------------
Example 1 : Check if a string is empty
-----------------------------------------------------------

# Prompt the user to enter their name.
read -p "Enter your name: " name

# '-z' checks whether the length of the string is zero.
# If the user presses Enter without typing anything,
# the condition becomes true.
if [ -z "$name" ]; then
    echo "Name cannot be empty."
else
    echo "Hello, $name!"
fi

-----------------------------------------------------------
Example 2 : Find the largest of three numbers
-----------------------------------------------------------

# Read three numbers from the user.
read -p "Enter three numbers: " num1 num2 num3

# Check whether num1 is greater than both num2 and num3.
if [ $num1 -gt $num2 ] && [ $num1 -gt $num3 ]; then
    echo "$num1 is the largest number."

# If the first condition is false, check whether
# num2 is greater than both num1 and num3.
elif [ $num2 -gt $num1 ] && [ $num2 -gt $num3 ]; then
    echo "$num2 is the largest number."

# If neither of the above conditions is true,
# then num3 must be the largest.
else
    echo "$num3 is the largest number."
fi

COMMENT

#-----------------------------------------------------------
# Actual Script Starts Here
#-----------------------------------------------------------

# Store the first command-line argument in the variable NUM.
# '$1' represents the first value passed while running the script.
NUM=$1

# Check whether the given number is greater than 20.
#
# '-gt' means "Greater Than".
if [ $NUM -gt 20 ]; then

    # This block executes if NUM is greater than 20.
    echo "given number is greater than 20."

# If the first condition is false, check whether
# the number is equal to 20.
#
# '-eq' means "Equal To".
elif [ $NUM -eq 20 ]; then

    # This block executes when NUM is exactly 20.
    echo "given number is equal to 20."

# If neither of the above conditions is true,
# the number must be less than 20.
else

    # This block executes when NUM is less than 20.
    echo "given number is less than 20."

# End of the if-elif-else statement.
fi

# Example 1:
# ./if_else_conditions.sh 30
# Output:
# given number is greater than 20.
#
# Example 2:
# ./if_else_conditions.sh 20
# Output:
# given number is equal to 20.
#
# Example 3:
# ./if_else_conditions.sh 10
# Output:
# given number is less than 20.