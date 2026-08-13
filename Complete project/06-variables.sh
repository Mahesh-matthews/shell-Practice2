#!/bin/bash
#-----------------------------------------------------------
# Shell Script 06 - Calculate Script Execution Time
# Script Name : execution_time.sh
# Purpose     : Calculate how long a script takes to execute
#               by recording the start and end times.
#
# Note:
#   - 'date +%s' returns the current time in Unix Epoch format
#     (number of seconds since January 1, 1970).
#   - By subtracting the start time from the end time, we can
#     determine the script's execution time in seconds.
#-----------------------------------------------------------

# ------------------- Method 1 -------------------
# The following lines are commented out.
# They demonstrate how to display the actual date and time
# when the script starts and ends.

# Store the current date and time in the variable START_TIME.
# START_TIME=$(date)

# Display the script start date and time.
# echo "Script Started at: $START_TIME"

# Pause the script for 10 seconds.
# This simulates a task that takes time to complete.
# sleep 10

# Store the current date and time after the delay.
# END_TIME=$(date)

# Display the script end date and time.
# echo "Script ended at : $END_TIME"


# ------------------- Method 2 -------------------
# This method calculates the total execution time.

# Store the current time in seconds (Epoch Time) in START_TIME.
# Example: 1785643205
START_TIME=$(date +%s)

# Display the start time in seconds.
echo "Script Started at: $START_TIME"

# Pause the script for 10 seconds.
# This simulates a process that takes time to execute.
sleep 10

# Store the current time in seconds after the script resumes.
END_TIME=$(date +%s)

# Calculate the total execution time.
# Arithmetic expansion $(()) performs mathematical calculations.
#
# Formula:
# Total Time = End Time - Start Time
#
# Example:
# START_TIME = 1785643205
# END_TIME   = 1785643215
# TOTAL_TIME = 10
TOTAL_TIME=$(($END_TIME - $START_TIME))

# Display the total execution time in seconds.
echo "Script ended at : $TOTAL_TIME seconds"

# Example Output:
#
# Script Started at: 1785643205
# Script ended at : 10 seconds