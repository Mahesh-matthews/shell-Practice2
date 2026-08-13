#!/bin/bash
#-----------------------------------------------------------
# Shell Script 21 - Install a Package with Root Validation
# Script Name : install_nginx.sh
# Purpose     : Check whether the script is executed as the
#               root user, install the Nginx package, and
#               verify whether the installation was successful.
#
# Usage       : sudo ./install_nginx.sh
#-----------------------------------------------------------

# Get the User ID (UID) of the current user.
#
# 'id -u' returns:
#   0  -> Root user
#   Non-zero -> Normal user
USERID=$(id -u)

# Check whether the current user is NOT the root user.
#
# '-ne' means "Not Equal".
if [ $USERID -ne 0 ]; then

    # Display an error message.
    # The script must be executed with root privileges
    # because package installation requires administrative access.
	echo "Please run this script with root access"

    # Exit the script with a non-zero exit status.
    exit 1

fi

#-----------------------------------------------------------
# Install Nginx
#-----------------------------------------------------------

# Display a message indicating that the installation
# process has started.
echo "Installing... nginx"

# Install the Nginx package.
#
# dnf      -> Package manager for RHEL-based Linux distributions.
# install  -> Installs the specified package.
# nginx    -> Package to install.
# -y       -> Automatically answers "Yes" to confirmation prompts.
dnf install nginx -y

#-----------------------------------------------------------
# Validate Installation
#-----------------------------------------------------------

# '$?' stores the exit status of the previous command.
#
# Exit Status:
#   0  -> Success
#   Non-zero -> Failure
#
# Check whether the installation failed.
if [ $? -ne 0 ]; then

    # Installation failed.
	echo "Installation is.... Failure"

    # Exit the script immediately.
    exit 1

else

    # Installation completed successfully.
	echo "Installation is.... Success"

# End of the if-else statement.
fi

#-----------------------------------------------------------
# Example:
#
# sudo ./install_nginx.sh
#
# Sample Output:
#
# Installing... nginx
# Last metadata expiration check: ...
# Dependencies resolved...
#
# Installation is.... Success
#
# If the installation fails:
#
# Installing... nginx
# Installation is.... Failure
#-----------------------------------------------------------