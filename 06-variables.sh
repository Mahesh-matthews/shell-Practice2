#!/bin/bash

#START_TIME=$(date)
#echo "Script Started at: $START_TIME"
##sleep 10 
#END_TIME=$(date)
#echo "Script ended at : $END_TIME"


START_TIME=$(date +%s)
echo "Script Started at: $START_TIME"
sleep 10 
END_TIME=$(date +%s)
TOTAL_TIME=$(($END_TIME-START_TIME))

echo "Script ended at : $END_TIME "
