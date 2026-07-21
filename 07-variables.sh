#!/bin/bash

echo "Script Name      : $0"
echo "First Argument   : $1"
echo "Second Argument  : $2"
echo "Total Arguments  : $#"
echo "All Arguments    : $@"
echo "Process ID       : $$"

pwd
echo "Exit Status      : $?"

echo "Current UID      : $UID"

sleep 30 &
echo "Background PID   : $!"