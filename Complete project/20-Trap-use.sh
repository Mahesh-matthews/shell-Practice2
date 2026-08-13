#!/bin/bash
#-----------------------------------------------------------
# Shell Script 20 - Package Installation with Error Handling
# Script Name : package_installation_trap.sh
# Purpose     : Install packages only if they are not already
#               installed, log all output to a log file, use
#               colored messages, and automatically terminate
#               the script if any command fails using
#               'set -e' and 'trap'.
#
# Usage       : sudo ./package_installation_trap.sh nginx mysql nodejs
#-----------------------------------------------------------

#-----------------------------------------------------------
# Enable Automatic Error Handling
#-----------------------------------------------------------

# 'set -e' tells Bash to terminate the script immediately
# whenever any command returns a non-zero exit status.
#
# This eliminates the need to manually check '$?' after
# every command.
set -e

#-----------------------------------------------------------
# Error Trap
#-----------------------------------------------------------

# The 'trap' command executes the specified command whenever
# the ERR event occurs.
#
# ERR is triggered whenever a command fails.
#
# Variables:
#   $LINENO       -> Line number where the error occurred.
#   $BASH_COMMAND -> Command that caused the error.
#
# Example Output:
# There is error in 42, Command: dnf install nginx -y
trap 'echo "There is error in $LINENO, Command: $BASH_COMMAND"' ERR

#-----------------------------------------------------------
# Get Current User ID
#-----------------------------------------------------------

# Store the current user's UID.
#
# id -u returns:
#   0  -> Root user
#   Non-zero -> Normal user
USERID=$(id -u)

#-----------------------------------------------------------
# Log File Configuration
#-----------------------------------------------------------

# Directory where log files are stored.
LOGS_FOLDER="/var/log/shell-scripting"

# Log file name.
# '$0' contains the current script name.
LOGS_FILE="/var/log/shell-scripting/$0.log"

#-----------------------------------------------------------
# ANSI Color Codes
#-----------------------------------------------------------

# Red - Error messages.
R="\e[31m"

# Green - Success messages (not used in this script).
G="\e[32m"

# Yellow - Installation messages.
Y="\e[33m"

# Blue - Informational messages.
B="\e[34m"

# Reset terminal color.
N="\e[0m"

#-----------------------------------------------------------
# Verify Root User
#-----------------------------------------------------------

# Check whether the current user is root.
#
# '-ne' means "Not Equal".
if [ $USERID -ne 0 ]; then

    # Display an error message in red.
    # The message is also appended to the log file.
    echo -e "${R}You are not running as root.${N}" | tee -a $LOGS_FILE

    # Exit the script.
    exit 1

fi

#-----------------------------------------------------------
# Create Log Directory
#-----------------------------------------------------------

# Create the log directory if it does not already exist.
#
# mkdir -p:
#   - Creates parent directories if necessary.
#   - Does not return an error if the directory already exists.
mkdir -p $LOGS_FOLDER

#-----------------------------------------------------------
# Loop Through All Packages
#-----------------------------------------------------------

# '$@' contains all command-line arguments.
#
# Example:
# sudo ./package_installation_trap.sh nginx mysql nodejs
#
# Loop iterations:
#   package = nginx
#   package = mysql
#   package = nodejs
for package in $@
do

    # Check whether the package is already installed.
    #
    # Exit Status:
    #   0  -> Package exists.
    #   Non-zero -> Package is not installed.
    #
    # '&>>' redirects both standard output
    # and standard error to the log file.
    dnf list installed $package &>> $LOGS_FILE

    # If the package is not installed,
    # install it.
    if [ $? -ne 0 ]; then

        # Display an installation message in yellow.
        echo -e "${Y}$package is not installed. Installing $package${N}" | tee -a $LOGS_FILE

        # Install the package.
        #
        # If this command fails:
        #   - The ERR trap is triggered.
        #   - The failed command and line number are displayed.
        #   - Because 'set -e' is enabled, the script exits immediately.
        dnf install $package -y &>> $LOGS_FILE

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
# sudo ./package_installation_trap.sh nginx mysql nodejs
#
# Sample Output:
#
# nginx is already installed. Skipping nginx
# mysql is not installed. Installing mysql
#
# If installation succeeds:
#   Script continues.
#
# If installation fails:
#
# There is error in 94, Command: dnf install mysql -y
#
# Script exits immediately.
#
# All installation output is saved in:
#
# /var/log/shell-scripting/package_installation_trap.sh.log
#-----------------------------------------------------------