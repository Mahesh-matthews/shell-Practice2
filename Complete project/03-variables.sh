#!/bin/bash
#-----------------------------------------------------------
#Shell Script 03 - Using Variables in a Conversation
# Script Name : conversation_variables.sh
# Purpose     : Demonstrate the use of variables in Bash by
#               displaying a conversation between two people.
#-----------------------------------------------------------

# Declare a variable named 'person1' and assign the value "Ramesh".
# Variables help avoid repeating the same value multiple times.
# Note: There should be NO spaces before or after the '=' sign.
person1="Ramesh"

# Declare another variable named 'person2' and assign the value "Suresh".
person2="Suresh"

# Print the first line of the conversation.
# '$person1' is replaced with "Ramesh".
# '$person2' is replaced with "Suresh".
echo "$person1: hi $person2, how are you?"

# Print the second line of the conversation.
# Here, the values of person2 and person1 are substituted before printing.
echo "$person2: hi $person1, I am fine, how are you?"

# Print the third line of the conversation.
# Bash expands '$person1' to its stored value.
echo "$person1: I am fine, Thanks for asking, what else?"

# Print the final line of the conversation.
# Bash expands '$person2' to "Suresh".
echo "$person2: Nothing new, Just going on"