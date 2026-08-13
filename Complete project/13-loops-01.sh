#!/bin/bash
#-----------------------------------------------------------
# Shell Script 13 - For Loop Example
# Script Name : for_loop.sh
# Purpose     : Demonstrate the use of a 'for' loop to print
#               numbers from 1 to 100.
#
# Usage       : ./for_loop.sh
#-----------------------------------------------------------

# The 'for' loop is used to execute a block of code
# repeatedly for each value in a given list.
#
# '{1..100}' is called Brace Expansion.
# It generates a sequence of numbers from 1 to 100.
#
# Values generated:
# 1 2 3 4 5 ... 100
for i in {1..100}
do

    # Print the current value of the variable 'i'.
    #
    # During each iteration:
    # First iteration  -> i = 1
    # Second iteration -> i = 2
    # Third iteration  -> i = 3
    # ...
    # Last iteration   -> i = 100
    echo "$i"

# Marks the end of the loop body.
done

#-----------------------------------------------------------
# Example Output:
#
# 1
# 2
# 3
# 4
# 5
# ...
# 98
# 99
# 100
#-----------------------------------------------------------