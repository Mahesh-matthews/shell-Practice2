#!/bin/bash
#-----------------------------------------------------------
# Shell Script 12 - Package Installation with Logging
# Script Name : package_installation_logging.sh
# Purpose     : Install multiple packages, validate each
#               installation, and save all command output
#               (both standard output and errors) to a log file.
#
# Usage       : sudo ./package_installation_logging.sh
#
# Note:
#   - The script must be run as the root user.
#   - All installation logs are stored under
#     /var/log/shell-scripting/.
#-----------------------------------------------------------

# Get the User ID (UID) of the current user.
# 'id -u' returns:
#   0  -> Root user
#   Non-zero -> Normal user
USERID=$(id -u)

# Define the folder where log files will be stored.
LOGS_FOLDER="/var/log/shell-scripting"

# Define the log file name.
# '$0' contains the script name.
#
# Example:
# If the script name is package_installation_logging.sh,
# then the log file becomes:
# /var/log/shell-scripting/package_installation_logging.sh.log
LOGS_FILE="/var/log/shell-scripting/$0.log"

# Check whether the current user is root.
if [ $USERID -ne 0 ]; then

    # Display the error message on the terminal and
    # simultaneously append it to the log file.
    #
    # tee  -> Displays output on the terminal.
    # -a   -> Appends output to the existing log file.
    echo "You are not running as root." | tee -a $LOGS_FILE

    # Exit the script with an error status.
    exit 1

fi

# Create the log directory if it does not already exist.
#
# mkdir -p
# - Creates the directory.
# - Does not return an error if the directory already exists.
# - Creates parent directories if needed.
mkdir -p $LOGS_FOLDER

#-----------------------------------------------------------
# Function : validate
# Purpose  : Check whether the previous command was successful.
#
# Parameters:
#   $1 -> Exit status of the previous command.
#   $2 -> Operation or package name.
#-----------------------------------------------------------
validate() {

    # Check if the exit status is NOT equal to zero.
    if [ $1 -ne 0 ]; then

        # Display the failure message and append it to the log file.
        echo "$2 ... Failure" | tee -a $LOGS_FILE

        # Stop script execution.
        exit 1

    else

        # Display the success message and append it to the log file.
        echo "$2 ... Success" | tee -a $LOGS_FILE

    fi

}

#-----------------------------------------------------------
# Install Nginx
#-----------------------------------------------------------

# Install the Nginx package.
#
# &>> redirects:
#   Standard Output (stdout)
#   Standard Error (stderr)
#
# Both are appended to the log file.
dnf install nginx -y &>> $LOGS_FILE

# Validate whether the installation succeeded.
validate $? "Installing Nginx"

#-----------------------------------------------------------
# Install MySQL
#-----------------------------------------------------------

# Install the MySQL package.
# All output and errors are written to the log file.
dnf install mysql -y &>> $LOGS_FILE

# Validate the installation.
validate $? "Installing MySQL"

#-----------------------------------------------------------
# Install Node.js
#-----------------------------------------------------------

# Install the Node.js package.
# Redirect all output to the log file.
dnf install nodejs -y &>> $LOGS_FILE

# Validate the installation.
validate $? "Installing Node.js"

#-----------------------------------------------------------
# Example:
#
# sudo ./package_installation_logging.sh
#
# Terminal Output:
#
# Installing Nginx ... Success
# Installing MySQL ... Success
# Installing Node.js ... Success
#
# Log File:
#
# /var/log/shell-scripting/package_installation_logging.sh.log
#
# The log file contains:
# - Package installation messages
# - dnf command output
# - Error messages (if any)
#-----------------------------------------------------------