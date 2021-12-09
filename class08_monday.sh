#!/bin/bash -x

cat <<greatings
Date : 06/12/21
greatings
echo -e "\n"

# :'
# arrayOfNumber=(10 20 30 40)
# echo ${arrayOfNumber[@]}
# echo ${arrayOfNumber[*]}
# echo ${arrayOfNumber[0]}
# echo ${arrayOfNumber[1]}
# echo ${arrayOfNumber[2]}
# echo ${arrayOfNumber[3]}
# echo ${#arrayOfNumber[@]}
# echo ${#arrayOfNumber[*]}

# for element in ${arrayOfNumber[@]}; do
#     echo ${element}
# done

# var='hello world!!!'
# echo ${var}
# '

checkEvenOrOdd() {
    if (($1 % 2 == 0))
    then
        echo "$1 is even"
    else
        echo "$1 is odd"
    fi
}

arrayOfNumber=(20 25 34 56 77 89)
lengthOfArray=${#arrayOfNumber[@]}
evenOrOddFirst() {
    for element in ${arrayOfNumber[@]}; do
        echo $(checkEvenOrOdd $element)
    done
}
# evenOrOddFirst
# echo -e "\n"

evenOrOddSecond() {
    for ((counter = 0; counter < lengthOfArray; counter++))
    do
        element=${arrayOfNumber[counter]}
        echo $(checkEvenOrOdd $element)
    done
}
evenOrOddSecond
echo -e "\n"

evenOrOddUsingWhile() {
    counter=0
    while [ $counter -lt $lengthOfArray ]; do
        element=${arrayOfNumber[counter]}
        echo $(checkEvenOrOdd $element)
        ((counter++))
    done
}
# evenOrOddUsingWhile
