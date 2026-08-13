#!/bin/bash
#-----------------------------------------------------------
# Shell Script 15 - Install Packages Only If Not Installed
# Script Name : package_installation_check.sh
# Purpose     : Check whether the given packages are already
#               installed. If a package is not installed,
#               install it and validate the installation.
#               All output is logged to a log file.
#
# Usage       : sudo ./package_installation_check.sh nginx mysql nodejs
#-----------------------------------------------------------

# Get the User ID (UID) of the current user.
# 'id -u' returns:
#   0  -> Root user
#   Non-zero -> Normal user
USERID=$(id -u)

# Define the folder where log files will be stored.
LOGS_FOLDER="/var/log/shell-scripting"

# Define the log file path.
# '$0' contains the current script name.
LOGS_FILE="/var/log/shell-scripting/$0.log"

# Check whether the script is being executed as the root user.
# '-ne' means "Not Equal".
if [ $USERID -ne 0 ]; then

    # Display an error message on the terminal and
    # append the same message to the log file.
    echo "You are not running as root." | tee -a $LOGS_FILE

    # Exit the script with a non-zero status.
    exit 1

fi

# Create the log directory if it does not already exist.
#
# mkdir -p
#   - Creates the directory.
#   - Does not throw an error if the directory already exists.
mkdir -p $LOGS_FOLDER

#-----------------------------------------------------------
# Function : validate
# Purpose  : Validate whether the previous command executed
#            successfully.
#
# Parameters:
#   $1 -> Exit status of the previous command.
#   $2 -> Package name or operation.
#-----------------------------------------------------------
validate() {

    # Check if the previous command failed.
    if [ $1 -ne 0 ]; then

        # Display the failure message and save it to the log file.
        echo "$2 ... Failure" | tee -a $LOGS_FILE

        # Stop the script immediately.
        exit 1

    else

        # Display the success message and save it to the log file.
        echo "$2 ... Success" | tee -a $LOGS_FILE

    fi

}

#-----------------------------------------------------------
# Loop Through All Packages Passed as Arguments
#-----------------------------------------------------------

# '$@' contains all command-line arguments.
#
# Example:
# sudo ./package_installation_check.sh nginx mysql nodejs
#
# Iteration 1 -> package = nginx
# Iteration 2 -> package = mysql
# Iteration 3 -> package = nodejs
for package in $@      # You can also use "$@" (recommended)
do

    # Check whether the package is already installed.
    #
    # 'dnf list installed <package>'
    # returns:
    #   Exit Status 0 -> Package is installed.
    #   Exit Status Non-zero -> Package is not installed.
    #
    # '&>>' redirects both standard output and
    # standard error to the log file.
    dnf list installed $package &>> $LOGS_FILE

    # Check whether the package is NOT installed.
    if [ $? -ne 0 ]; then

        # Inform the user that the package is not installed.
        echo "$package is not installed. Installing $package" | tee -a $LOGS_FILE

        # Install the package.
        dnf install $package -y &>> $LOGS_FILE

        # Validate whether the installation succeeded.
        validate $? "Installing $package"

    else

        # Inform the user that the package is already installed.
        # No installation is performed.
        echo "$package is already installed. Skipping $package" | tee -a $LOGS_FILE

    fi

# End of the for loop.
done

#-----------------------------------------------------------
# Example:
#
# sudo ./package_installation_check.sh nginx mysql nodejs
#
# Sample Output:
#
# nginx is already installed. Skipping nginx
# mysql is not installed. Installing mysql
# Installing mysql ... Success
# nodejs is already installed. Skipping nodejs
#
# All installation details and command outputs are
# saved in:
#
# /var/log/shell-scripting/package_installation_check.sh.log
#-----------------------------------------------------------