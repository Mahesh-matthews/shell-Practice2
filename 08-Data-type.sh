NUM1=100
NUM2=300

SUM=$(($NUM1+$NUM2))

echo "SUM IS : $SUM"

FRUITS=("Apple" "Banana" "Pomo")
echo "Fruits of : ${FRUITS{@}}"