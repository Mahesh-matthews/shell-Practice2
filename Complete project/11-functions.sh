#!/bin/bash
#-----------------------------------------------------------
# Shell Script 11 - Package Installation Using Functions
# Script Name : package_installation_function.sh
# Purpose     : Demonstrate how to use a function to validate
#               the installation status of multiple packages.
#
# Usage       : sudo ./package_installation_function.sh
#
# Note:
#   - This script must be executed as the root user.
#   - A reusable function named 'validate' is used to
#     avoid writing the same validation code multiple times.
#-----------------------------------------------------------

# Get the User ID (UID) of the current user.
# 'id -u' returns:
#   0  -> Root user
#   Non-zero -> Normal user
USERID=$(id -u)

# Check whether the current user is root.
# '-ne' means "Not Equal".
if [ $USERID -ne 0 ]; then

    # Display an error message.
    echo "You are not running as root."

    # Exit the script with status code 1.
    exit 1

fi

#-----------------------------------------------------------
# Function : validate
# Purpose  : Check whether the previous command executed
#            successfully.
#
# Parameters:
#   $1 -> Exit status of the previous command.
#   $2 -> Name of the operation/package.
#-----------------------------------------------------------
validate() {

    # Check whether the exit status is NOT equal to zero.
    # Exit status:
    #   0  -> Success
    #   Non-zero -> Failure
    if [ $1 -ne 0 ]; then

        # Display a failure message using the second argument.
        echo "$2 ... Failure"

        # Stop the script immediately.
        exit 1

    else

        # Display a success message.
        echo "$2 ... Success"

    fi

}

#-----------------------------------------------------------
# Install Nginx
#-----------------------------------------------------------

# Display the package being installed.
echo "Installing Nginx web server"

# Install the Nginx package.
# '-y' automatically answers "Yes" to installation prompts.
dnf install nginx -y

# Pass the exit status of the previous command and
# the package name to the validate() function.
#
# $? -> Exit status
# "Installing Nginx" -> Message to display
validate $? "Installing Nginx"

#-----------------------------------------------------------
# Install MySQL
#-----------------------------------------------------------

# Display the package being installed.
echo "Installing MySQL database"

# Install the MySQL package.
dnf install mysql -y

# Validate the installation.
validate $? "Installing MySQL"

#-----------------------------------------------------------
# Install Node.js
#-----------------------------------------------------------

# Display the package being installed.
echo "Installing Node.js"

# Install the Node.js package.
dnf install nodejs -y

# Validate the installation.
validate $? "Installing Node.js"

#-----------------------------------------------------------
# Example:
#
# sudo ./package_installation_function.sh
#
# Sample Output:
#
# Installing Nginx web server
# Installing Nginx ... Success
#
# Installing MySQL database
# Installing MySQL ... Success
#
# Installing Node.js
# Installing Node.js ... Success
#
# If any installation fails:
#
# Installing MySQL ... Failure
#
# The script immediately exits with status code 1.
#-----------------------------------------------------------