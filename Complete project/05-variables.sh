#!/bin/bash
#-----------------------------------------------------------
#Shell Script 05 - Reading User Input from the Keyboard
# Script Name : user_input.sh
# Purpose     : Demonstrate how to read user input from the
#               keyboard using the 'read' command.
#
# Note:
#   - 'read' waits for the user to enter a value.
#   - 'read -s' hides the input while typing (useful for passwords).
#-----------------------------------------------------------

# Display a message asking the user to enter their username.
echo "Enter your Username:"

# Read the username entered by the user and store it in the variable USER_NAME.
read USER_NAME

# Display the username entered by the user.
# '$USER_NAME' is replaced with the value entered by the user.
echo "User name is : $USER_NAME"

# Display a message asking the user to enter their password.
echo "Enter your Password:"

# Read the password entered by the user.
# The '-s' option means 'silent mode', so the password will not
# be displayed on the screen while the user types.
#
# Note:
# In this example, the password is also stored in USER_NAME.
# Although this works, it is not a good practice because it
# overwrites the username stored earlier.
# It is better to use a separate variable such as PASSWORD.
read -s USER_NAME

# Display the value stored in USER_NAME.
# Since USER_NAME now contains the password, this line will
# print the password instead of the username.
#
# Warning:
# Printing passwords is NOT recommended in real-world scripts,
# as it exposes sensitive information.
echo "User name is : $USER_NAME"

# Example:
# Enter your Username:
# Mahesh
# User name is : Mahesh
#
# Enter your Password:
# ******** (hidden while typing)
# User name is : MyPassword123