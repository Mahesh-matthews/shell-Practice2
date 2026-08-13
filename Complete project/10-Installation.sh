#!/bin/bash
#-----------------------------------------------------------
# Shell Script 10 - Install Multiple Packages with Validation
# Script Name : package_installation.sh
# Purpose     : Check whether the script is executed as the
#               root user and install Nginx, MySQL, and
#               Node.js. Validate each installation using
#               the command exit status.
#
# Usage       : sudo ./package_installation.sh
#-----------------------------------------------------------

# Get the User ID (UID) of the current user.
# 'id -u' returns:
#   0    -> Root user
#   1000 -> Normal user (or another non-zero UID)
USERID=$(id -u)

# Check whether the current user is NOT the root user.
# '-ne' means "Not Equal".
if [ $USERID -ne 0 ]; then

    # Inform the user that the script must be run as root.
    echo "You are not running as root."

    # Exit the script with status code 1.
    # A non-zero exit code indicates that the script failed.
    exit 1
fi

#-----------------------------------------------------------
# Install Nginx
#-----------------------------------------------------------

# Display a message indicating that Nginx installation has started.
echo "Installing Nginx web server"

# Install the Nginx package.
# '-y' automatically answers "Yes" to all prompts.
dnf install nginx -y

# Check the exit status of the previous command.
# '$?' stores the exit status.
# 0  -> Success
# Non-zero -> Failure
if [ $? -ne 0 ]; then

    # Installation failed.
    echo "Installing Nginx ... Failure"

    # Stop the script immediately.
    exit 1

else

    # Installation completed successfully.
    echo "Installing Nginx ... Success"

fi

#-----------------------------------------------------------
# Install MySQL
#-----------------------------------------------------------

# Display a message indicating that MySQL installation has started.
echo "Installing MySQL database"

# Install the MySQL package.
dnf install mysql -y

# Check whether the installation succeeded.
if [ $? -ne 0 ]; then

    # Installation failed.
    echo "Installing MySQL ... Failure"

    # Exit the script.
    exit 1

else

    # Installation succeeded.
    echo "Installing MySQL ... Success"

fi

#-----------------------------------------------------------
# Install Node.js
#-----------------------------------------------------------

# Display a message indicating that Node.js installation has started.
echo "Installing Node.js"

# Install the Node.js package.
dnf install nodejs -y

# Check the exit status of the installation command.
if [ $? -ne 0 ]; then

    # Installation failed.
    echo "Installing Node.js ... Failure"

    # Exit the script.
    exit 1

else

    # Installation succeeded.
    echo "Installing Node.js ... Success"

fi

#-----------------------------------------------------------
# Example:
#
# sudo ./package_installation.sh
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
#-----------------------------------------------------------