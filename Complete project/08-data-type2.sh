#!/usr/bin/env bash
#-----------------------------------------------------------
# Shell Script 08 - Arithmetic Operations and Arrays in Bash (Part 2)
# Script Name : arithmetic_and_arrays_part2.sh
# Purpose     : Demonstrate arithmetic operations and the
#               use of arrays in Bash scripting.
#
# Usage       : ./arithmetic_and_arrays_part2.sh
#-----------------------------------------------------------

# Assign the value 100 to the variable NUM1.
NUM1=100

# Assign the value 300 to the variable NUM2.
NUM2=300

# Perform addition using arithmetic expansion.
# $(()) is used to evaluate arithmetic expressions in Bash.
#
# Calculation:
# 100 + 300 = 400
SUM=$(($NUM1 + $NUM2))

# Display the calculated sum.
echo "SUM IS : $SUM"

# Create an array named FRUITS.
# Arrays store multiple values in a single variable.
#
# Index Positions:
# 0 -> Apple
# 1 -> Banana
# 2 -> Pomo
FRUITS=("Apple" "Banana" "Pomo")

# Display all elements of the array.
# '${FRUITS[@]}' returns all array elements.
#
# Note:
# The original script contains:
# echo echo "Fruits are :" "${FRUITS[@]}"
#
# This is a typo. It should be:
echo "Fruits are : ${FRUITS[@]}"

# Display the first element of the array.
# Array indexing starts from 0.
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