#!/bin/bash
#-----------------------------------------------------------
# Shell Script 16 - Display Colored Text in Bash
# Script Name : colors.sh
# Purpose     : Demonstrate how to print colored text in the
#               terminal using ANSI escape sequences.
#
# Usage       : ./colors.sh
#-----------------------------------------------------------

#-----------------------------------------------------------
# Multi-line Comment
#-----------------------------------------------------------
#
# The ':' command does nothing.
# It is used with a here-document (<<) to create
# a multi-line comment in Bash.
#
# Everything between <<'COMMENT' and COMMENT is ignored.
#
: <<'COMMENT'

# Store the ANSI escape sequence for Red color.
Red='\e[31m'

# Store the ANSI escape sequence for Green color.
Green='\e[32m'

# Store the ANSI escape sequence for Yellow color.
Yellow='\e[33m'

# Store the ANSI escape sequence for Blue color.
Blue='\e[34m'

# (Optional) Reset color back to the terminal's default.
# Without resetting, the terminal may continue using
# the previously selected color.
NC='\e[0m'

# Print text in Red.
# '-e' enables interpretation of escape sequences.
echo -e "${Red}This is red color${NC}"

# Print text in Green.
echo -e "${Green}This is green color${NC}"

# Print text in Yellow.
echo -e "${Yellow}This is yellow color${NC}"

# Print text in Blue.
echo -e "${Blue}This is blue color${NC}"

COMMENT

#-----------------------------------------------------------
# Actual Script Starts Here
#-----------------------------------------------------------

# Print "hello world" in Red.
#
# echo  -> Prints text to the terminal.
# -e    -> Enables interpretation of escape characters.
# \e[31m -> Changes the text color to Red.
#
# Note:
# Since there is no reset color (\e[0m), the terminal may
# continue displaying subsequent text in red until it is reset.
echo -e "\e[31m hello world"

#-----------------------------------------------------------
# Example Output:
#
# hello world
#
# (The text appears in Red.)
#-----------------------------------------------------------