#!/bin/bash
#-----------------------------------------------------------
# Shell Script 19 - Error Handling Using set -e and trap
# Script Name : error_handling_trap.sh
# Purpose     : Demonstrate how to use 'set -e' along with
#               the 'trap' command to detect errors, display
#               the line number where the error occurred,
#               and show the command that caused the failure.
#
# Usage       : ./error_handling_trap.sh
#-----------------------------------------------------------

#-----------------------------------------------------------
# Enable Exit on Error
#-----------------------------------------------------------

# 'set -e' tells Bash to terminate the script immediately
# whenever a command returns a non-zero exit status.
#
# Example:
# If any command fails, the remaining lines of the script
# are not executed.
set -e

#-----------------------------------------------------------
# Error Trap
#-----------------------------------------------------------

# 'trap' is used to execute a command whenever a specified
# signal or event occurs.
#
# ERR is a special event that is triggered whenever
# a command exits with a non-zero status.
#
# Variables used:
#
# $LINENO
#   -> Displays the line number where the error occurred.
#
# $BASH_COMMAND
#   -> Displays the command that caused the error.
#
# Example Output:
#
# There is error in 28, Command: echooo "Printing error here"
#
trap 'echo "There is error in $LINENO, Command: $BASH_COMMAND"' ERR

#-----------------------------------------------------------
# Print a Message
#-----------------------------------------------------------

# Display a simple message.
echo "Hello World"

# Display another message.
echo "This is a test script"

#-----------------------------------------------------------
# Intentional Error
#-----------------------------------------------------------

# This command is intentionally incorrect.
#
# 'echooo' is NOT a valid Linux command.
# The correct command is:
#
# echo "Printing error here"
#
# Because 'echooo' does not exist:
#   - Bash returns a non-zero exit status.
#   - The ERR trap is triggered.
#   - The trap prints the line number and failed command.
#   - Since 'set -e' is enabled, the script immediately exits.
echooo "Printing error here"

#-----------------------------------------------------------
# This Line Will Never Execute
#-----------------------------------------------------------

# Because the previous command failed and 'set -e'
# terminated the script, this line is never reached.
echo "No error here"

#-----------------------------------------------------------
# Example Output:
#
# Hello World
# This is a test script
# ./error_handling_trap.sh: line 54: echooo: command not found
# There is error in 54, Command: echooo "Printing error here"
#
# (The script exits immediately.)
#-----------------------------------------------------------