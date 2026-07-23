#!/usr/bin/env bash
NUM1=100
NUM2=300

SUM=$(($NUM1 + $NUM2))

echo "SUM IS : $SUM"

FRUITS=("Apple" "Banana" "Pomo")
echo echo "Fruits are :" "${FRUITS[@]}"
echo "1st Fruit is : ${FRUITS[0]}"
echo "2nd Fruit is: ${FRUITS[1]}"
echo "3rd Fruit is: ${FRUITS[2]}"