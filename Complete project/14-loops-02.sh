#!/bin/bash
#-----------------------------------------------------------
# Shell Script 14 - Install Multiple Packages Using a For Loop
# Script Name : package_installation_loop.sh
# Purpose     : Install multiple packages passed as
#               command-line arguments using a for loop,
#               validate each installation, and save all
#               command output to a log file.
#
# Usage       : sudo ./package_installation_loop.sh nginx mysql nodejs
#-----------------------------------------------------------

# Get the User ID (UID) of the current user.
# 'id -u' returns:
#   0  -> Root user
#   Non-zero -> Normal user
USERID=$(id -u)

# Specify the folder where log files will be stored.
LOGS_FOLDER="/var/log/shell-scripting"

# Specify the log file name.
# '$0' contains the current script name.
LOGS_FILE="/var/log/shell-scripting/$0.log"

# Check whether the script is being executed by the root user.
# '-ne' means "Not Equal".
if [ $USERID -ne 0 ]; then

    # Display the error message on the terminal and
    # append the same message to the log file.
    echo "You are not running as root." | tee -a $LOGS_FILE

    # Stop script execution.
    exit 1

fi

# Create the log directory if it does not already exist.
#
# mkdir -p:
#   - Creates the directory.
#   - Does not throw an error if the directory already exists.
mkdir -p $LOGS_FOLDER

#-----------------------------------------------------------
# Function : validate
# Purpose  : Check whether the previous command completed
#            successfully.
#
# Parameters:
#   $1 -> Exit status of the previous command.
#   $2 -> Package name or operation.
#-----------------------------------------------------------
validate() {

    # Check whether the exit status is not equal to zero.
    if [ $1 -ne 0 ]; then

        # Display a failure message and save it to the log file.
        echo "$2 ... Failure" | tee -a $LOGS_FILE

        # Stop the script immediately.
        exit 1

    else

        # Display a success message and save it to the log file.
        echo "$2 ... Success" | tee -a $LOGS_FILE

    fi

}

#-----------------------------------------------------------
# Install Packages Using a For Loop
#-----------------------------------------------------------

# '$@' represents all command-line arguments passed to the script.
#
# Example:
# sudo ./package_installation_loop.sh nginx mysql nodejs
#
# Values of '$@':
# nginx
# mysql
# nodejs
#
# During each iteration, one package name is stored
# in the variable 'package'.
for package in "$@"
do

    # Install the current package.
    #
    # Example:
    # First iteration  -> dnf install nginx -y
    # Second iteration -> dnf install mysql -y
    # Third iteration  -> dnf install nodejs -y
    #
    # '&>>' redirects both standard output and
    # standard error to the log file.
    dnf install "$package" -y &>> $LOGS_FILE

    # Validate whether the package installation succeeded.
    validate $? "Installing $package"

# End of the loop.
done

#-----------------------------------------------------------
# Example:
#
# sudo ./package_installation_loop.sh nginx mysql nodejs
#
# Terminal Output:
#
# Installing nginx ... Success
# Installing mysql ... Success
# Installing nodejs ... Success
#
# Log File:
#
# /var/log/shell-scripting/package_installation_loop.sh.log
#
# The log file contains all installation messages,
# command output, and error messages.
#-----------------------------------------------------------