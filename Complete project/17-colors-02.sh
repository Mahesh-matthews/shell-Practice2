#!/bin/bash
#-----------------------------------------------------------
# Shell Script 17 - Package Installation with Colored Output
# Script Name : package_installation_colors.sh
# Purpose     : Check whether packages are already installed.
#               If not, install them, validate the installation,
#               display colored status messages, and save all
#               command output to a log file.
#
# Usage       : sudo ./package_installation_colors.sh nginx mysql nodejs
#-----------------------------------------------------------

# Get the User ID (UID) of the current user.
# 'id -u' returns:
#   0  -> Root user
#   Non-zero -> Normal user
USERID=$(id -u)

# Specify the directory where log files will be stored.
LOGS_FOLDER="/var/log/shell-scripting"

# Specify the log file.
# '$0' contains the name of the currently executing script.
LOGS_FILE="/var/log/shell-scripting/$0.log"

#-----------------------------------------------------------
# ANSI Color Codes
#-----------------------------------------------------------

# Red color - Used for error messages.
R="\e[31m"

# Green color - Used for success messages.
G="\e[32m"

# Yellow color - Used for warning or informational messages.
Y="\e[33m"

# Blue color - Used for messages indicating no action is required.
B="\e[34m"

# Reset terminal color back to the default.
N="\e[0m"

#-----------------------------------------------------------
# Check Whether the Script is Executed as Root
#-----------------------------------------------------------

# '-ne' means "Not Equal".
if [ $USERID -ne 0 ]; then

    # Display an error message in Red.
    #
    # echo -e
    #   - Enables interpretation of escape sequences.
    #
    # tee -a
    #   - Displays the message on the terminal.
    #   - Appends the same message to the log file.
    echo -e "${R}You are not running as root.${N}" | tee -a $LOGS_FILE

    # Stop script execution.
    exit 1

fi

#-----------------------------------------------------------
# Create Log Directory
#-----------------------------------------------------------

# Create the log directory if it does not already exist.
#
# mkdir -p
#   - Creates the directory.
#   - Does not produce an error if the directory already exists.
mkdir -p $LOGS_FOLDER

#-----------------------------------------------------------
# Function : validate
# Purpose  : Validate whether the previous command executed
#            successfully.
#
# Parameters:
#   $1 -> Exit status of the previous command.
#   $2 -> Operation or package name.
#-----------------------------------------------------------
validate() {

    # Check whether the previous command failed.
    if [ $1 -ne 0 ]; then

        # Print the failure message in Red.
        echo -e "${R}$2 ... Failure${N}" | tee -a $LOGS_FILE

        # Stop script execution immediately.
        exit 1

    else

        # Print the success message in Green.
        echo -e "${G}$2 ... Success${N}" | tee -a $LOGS_FILE

    fi

}

#-----------------------------------------------------------
# Install Packages
#-----------------------------------------------------------

# '$@' represents all command-line arguments.
#
# Example:
# sudo ./package_installation_colors.sh nginx mysql nodejs
#
# Iteration 1 -> nginx
# Iteration 2 -> mysql
# Iteration 3 -> nodejs
for package in $@
do

    # Check whether the current package is already installed.
    #
    # 'dnf list installed' returns:
    #   Exit Status 0  -> Installed
    #   Exit Status !=0 -> Not Installed
    #
    # '&>>' redirects both standard output and
    # standard error to the log file.
    dnf list installed $package &>> $LOGS_FILE

    # Check if the package is NOT installed.
    if [ $? -ne 0 ]; then

        # Display a warning message in Yellow.
        echo -e "${Y}$package is not installed. Installing $package${N}" | tee -a $LOGS_FILE

        # Install the package.
        dnf install $package -y &>> $LOGS_FILE

        # Validate the installation.
        validate $? "Installing $package"

    else

        # Display an informational message in Blue.
        echo -e "${B}$package is already installed. Skipping $package${N}" | tee -a $LOGS_FILE

    fi

# End of the loop.
done

#-----------------------------------------------------------
# Example:
#
# sudo ./package_installation_colors.sh nginx mysql nodejs
#
# Terminal Output:
#
# (Blue)   nginx is already installed. Skipping nginx
# (Yellow) mysql is not installed. Installing mysql
# (Green)  Installing mysql ... Success
# (Blue)   nodejs is already installed. Skipping nodejs
#
# All command output and errors are saved to:
#
# /var/log/shell-scripting/package_installation_colors.sh.log
#-----------------------------------------------------------