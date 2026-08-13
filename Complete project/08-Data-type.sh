#!/bin/bash
#-----------------------------------------------------------
#Shell Script 08 - Arithmetic Operations and Arrays in Bash
# Script Name : arithmetic_and_arrays.sh
# Purpose     : Demonstrate arithmetic operations and the
#               use of arrays in Bash scripting.
#
# Note:
#   - The second shebang line is unnecessary because Bash
#     uses only the first shebang line in the script.
#-----------------------------------------------------------

#!/usr/bin/env bash
# This line is ignored because it is not the first line.
# If you want to use '/usr/bin/env bash', it should replace
# the first shebang line, not appear after it.

# Assign the value 100 to the variable NUM1.
NUM1=100

# Assign the value 300 to the variable NUM2.
NUM2=300

# Perform arithmetic addition using Bash arithmetic expansion.
# $(()) evaluates mathematical expressions.
#
# Formula:
# SUM = NUM1 + NUM2
#
# Result:
# SUM = 100 + 300 = 400
SUM=$(($NUM1 + $NUM2))

# Display the calculated sum.
echo "SUM IS : $SUM"

#-----------------------------------------------------------
# Arrays in Bash
#-----------------------------------------------------------

# Create an array named FRUITS.
# Arrays allow multiple values to be stored under one variable.
#
# Index Positions:
# 0 -> Apple
# 1 -> Banana
# 2 -> Pomo
FRUITS=("Apple" "Banana" "Pomo")

# Display all elements of the array.
# '${FRUITS[@]}' returns every element in the array.
echo "Fruits are : ${FRUITS[@]}"

# Display the first element of the array.
# Array indexing starts from 0 in Bash.
echo "1st Fruit is : ${FRUITS[0]}"

# Display the second element of the array.
echo "2nd Fruit is : ${FRUITS[1]}"

# Display the third element of the array.
echo "3rd Fruit is : ${FRUITS[2]}"

# Example Output:
#
# SUM IS : 400
# Fruits are : Apple Banana Pomo
# 1st Fruit is : Apple
# 2nd Fruit is : Banana
# 3rd Fruit is : Pomo