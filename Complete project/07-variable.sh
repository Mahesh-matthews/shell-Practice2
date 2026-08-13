#!/bin/bash
#-----------------------------------------------------------
#Shell Script 07 - Special Variables in Bash
# Script Name : special_variables.sh
# Purpose     : Demonstrate the commonly used special
#               variables available in Bash scripting.
#
# Usage:
#   ./special_variables.sh apple banana
#
#   $0  -> Script name
#   $1  -> First argument
#   $2  -> Second argument
#   $#  -> Total number of arguments
#   $@  -> All arguments
#   $$  -> Current script Process ID (PID)
#   $?  -> Exit status of the previous command
#   $UID -> Current user's User ID
#   $!  -> Process ID of the last background process
#-----------------------------------------------------------

# Display the name of the script being executed.
# '$0' always contains the script name or path used to run it.
echo "Script Name      : $0"

# Display the first command-line argument.
# '$1' stores the first value passed to the script.
echo "First Argument   : $1"

# Display the second command-line argument.
# '$2' stores the second value passed to the script.
echo "Second Argument  : $2"

# Display the total number of command-line arguments.
# '$#' returns how many arguments were supplied.
echo "Total Arguments  : $#"

# Display all command-line arguments.
# '$@' returns every argument passed to the script.
echo "All Arguments    :" "$@"

# Display the Process ID (PID) of the currently running script.
# '$$' is useful when creating temporary files or debugging.
echo "Process ID       : $$"

# Print the current working directory.
# 'pwd' stands for Print Working Directory.
pwd

# Display the exit status of the previous command.
# '$?' contains the exit code of the command executed immediately before it.
# Since 'pwd' normally succeeds, the exit status should be 0.
echo "Exit Status      : $?"

# Display the User ID (UID) of the current user.
# UID 0 represents the root user.
# Other users typically have a UID of 1000 or higher.
echo "Current UID      : $UID"

# Start the 'sleep' command in the background.
# '&' tells Bash to run the command without waiting for it to finish.
sleep 30 &

# Display the Process ID (PID) of the last background process.
# '$!' always stores the PID of the most recently started background job.
echo "Background PID   : $!"

# Example:
# ./special_variables.sh Ramesh Suresh
#
# Sample Output:
# Script Name      : ./special_variables.sh
# First Argument   : Ramesh
# Second Argument  : Suresh
# Total Arguments  : 2
# All Arguments    : Ramesh Suresh
# Process ID       : 24561
# /home/ec2-user/scripts
# Exit Status      : 0
# Current UID      : 1000
# Background PID   : 24562