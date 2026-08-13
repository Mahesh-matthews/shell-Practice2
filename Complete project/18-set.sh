#!/bin/bash
#-----------------------------------------------------------
# Shell Script 18 - Package Installation Using set -e
# Script Name : package_installation_sete.sh
# Purpose     : Demonstrate the use of 'set -e' to terminate
#               the script immediately when any command fails.
#               The script installs packages only if they are
#               not already installed, displays colored
#               messages, and writes logs to a log file.
#
# Usage       : sudo ./package_installation_sete.sh nginx mysql nodejs
#-----------------------------------------------------------

#-----------------------------------------------------------
# Enable Exit on Error
#-----------------------------------------------------------

# 'set -e' instructs Bash to terminate the script immediately
# if any command returns a non-zero (failure) exit status.
#
# This reduces the need to manually check '$?' after every command.
#
# Example:
# If 'dnf install nginx -y' fails,
# the script exits immediately without executing the remaining code.
set -e

#-----------------------------------------------------------
# Get Current User ID
#-----------------------------------------------------------

# 'id -u' returns the User ID (UID) of the current user.
#
# UID:
#   0  -> Root user
#   Non-zero -> Normal user
USERID=$(id -u)

#-----------------------------------------------------------
# Log File Configuration
#-----------------------------------------------------------

# Directory where log files will be stored.
LOGS_FOLDER="/var/log/shell-scripting"

# Log file name.
# '$0' contains the current script name.
LOGS_FILE="/var/log/shell-scripting/$0.log"

#-----------------------------------------------------------
# ANSI Color Codes
#-----------------------------------------------------------

# Red - Error messages.
R="\e[31m"

# Green - Success messages.
G="\e[32m"

# Yellow - Warning/Installation messages.
Y="\e[33m"

# Blue - Informational messages.
B="\e[34m"

# Reset terminal color.
N="\e[0m"

#-----------------------------------------------------------
# Verify Root User
#-----------------------------------------------------------

# Check whether the current user is NOT root.
# '-ne' means "Not Equal".
if [ $USERID -ne 0 ]; then

    # Display an error message in red and save it to the log file.
    echo -e "${R}You are not running as root.${N}" | tee -a $LOGS_FILE

    # Exit the script.
    exit 1

fi

#-----------------------------------------------------------
# Create Log Directory
#-----------------------------------------------------------

# Create the log directory if it does not already exist.
#
# mkdir -p
#   - Creates the directory.
#   - Does not fail if the directory already exists.
mkdir -p $LOGS_FOLDER

#-----------------------------------------------------------
# Function : validate
# Purpose  : Validate the exit status of a command.
#
# Note:
# This function is currently NOT used because 'set -e'
# automatically terminates the script whenever a command fails.
#-----------------------------------------------------------
validate() {

    # Check whether the previous command failed.
    if [ $1 -ne 0 ]; then

        # Display failure message.
        echo -e "${R}$2 ... Failure${N}" | tee -a $LOGS_FILE

        # Exit the script.
        exit 1

    else

        # Display success message.
        echo -e "${G}$2 ... Success${N}" | tee -a $LOGS_FILE

    fi

}

#-----------------------------------------------------------
# Install Packages
#-----------------------------------------------------------

# '$@' represents all command-line arguments.
#
# Example:
# sudo ./package_installation_sete.sh nginx mysql nodejs
#
# Iteration 1 -> nginx
# Iteration 2 -> mysql
# Iteration 3 -> nodejs
for package in $@
do

    # Check whether the package is already installed.
    #
    # Exit Status:
    #   0  -> Installed
    #   Non-zero -> Not Installed
    dnf list installed $package &>> $LOGS_FILE

    # If the package is not installed,
    # install it.
    if [ $? -ne 0 ]; then

        # Display a warning message in yellow.
        echo -e "${Y}$package is not installed. Installing $package${N}" | tee -a $LOGS_FILE

        # Install the package.
        #
        # Because 'set -e' is enabled,
        # if this command fails, the script exits immediately.
        dnf install $package -y &>> $LOGS_FILE

        # The validate() function is intentionally commented out.
        # 'set -e' already performs automatic error handling.
        #
        # validate $? "Installing $package"

    else

        # Package already exists.
        # Display an informational message in blue.
        echo -e "${B}$package is already installed. Skipping $package${N}" | tee -a $LOGS_FILE

    fi

# End of the loop.
done

#-----------------------------------------------------------
# Example:
#
# sudo ./package_installation_sete.sh nginx mysql nodejs
#
# Terminal Output:
#
# (Blue)   nginx is already installed. Skipping nginx
# (Yellow) mysql is not installed. Installing mysql
# (If installation succeeds, the script continues.)
#
# If 'dnf install mysql -y' fails:
#
# The script immediately terminates because 'set -e'
# is enabled.
#
# All installation output is saved in:
#
# /var/log/shell-scripting/package_installation_sete.sh.log
#-----------------------------------------------------------