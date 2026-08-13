#!/bin/bash
#-----------------------------------------------------------
#Shell Script 04 - Using Command Line Arguments
# Script Name : conversation_arguments.sh
# Purpose     : Demonstrate how to use command-line arguments
#               in a Bash script to make it dynamic.
#
# Usage       : ./conversation_arguments.sh Ramesh Suresh
#               $1 = Ramesh
#               $2 = Suresh
#-----------------------------------------------------------

# Store the first command-line argument in the variable 'person1'.
# '$1' represents the first value passed while executing the script.
person1="$1"

# Store the second command-line argument in the variable 'person2'.
# '$2' represents the second value passed while executing the script.
person2="$2"

# Print the first line of the conversation.
# '$person1' and '$person2' are replaced with the values
# provided as command-line arguments.
echo "$person1: hi $person2, how are you?"

# Print the second line of the conversation.
# The variables are expanded to display the names passed by the user.
echo "$person2: hi $person1, I am fine, how are you?"

# Print the third line of the conversation.
echo "$person1: I am fine, Thanks for asking, what else?"

# Print the final line of the conversation.
echo "$person2: Nothing new, Just going on"

# Example:
# ./conversation_arguments.sh Ramesh Suresh
#
# Output:
# Ramesh: hi Suresh, how are you?
# Suresh: hi Ramesh, I am fine, how are you?
# Ramesh: I am fine, Thanks for asking, what else?
# Suresh: Nothing new, Just going on