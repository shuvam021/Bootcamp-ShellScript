#!/bin/bash

# =======================================
# Dictionary Practice Problems
# =======================================
# 1. Write a program in the following steps
#     a. Roll a die and find the number between 1 to 6
#     b. Repeat the Die roll and find the result each time
#     c. Store the result in a dictionary
#     d. Repeat till any one of the number has reached 10 times
#     e. Find the number that reached maximum times and the one that was for minimum times

answer01() {
    declare -a dice
    declare -a uniqueDice
    declare -A diceResult
    read -p "no of dice roll you want: " n

    # option a-d
    # "============================================="
    # rendom array
    echo "============================================="
    echo -e "\t\tHear we go"
    echo "============================================="
    for ((i = 0; i < $n; i++)); do
        dice[$i]=$(($RANDOM % 6 + 1))
        echo "roll $(($i + 1)) == ${dice[$i]}"
        sleep 1
    done

    # option e
    # "============================================="
    # # removing duplicate value
    for i in ${dice[@]}; do
        for j in ${dice[@]}; do
            if (($i == $j)); then
                uniqueDice[i]=$i
            fi
        done
    done

    len=${#dice[@]}

    # # counting each value's occurrance
    for item in ${uniqueDice[@]}; do
        count=0
        for ((j = 0; j < len; j++)); do
            if (($item == ${dice[j]})); then
                ((count++))
            fi
            diceResult["$item"]=$count
        done
    done

    maxOccurrance=0
    for item in ${diceResult[@]}; do
        if (($maxOccurrance < $item)); then
            maxOccurrance=$item
        fi
    done

    maxOccurredItem=0
    for item in ${!diceResult[@]}; do
        if ((${diceResult[$item]} == $maxOccurrance)); then
            maxOccurredItem=$item
        fi
    done

    clear
    echo -e "\t\tResults\t\t"
    echo "============================================="
    echo "original array = ${dice[@]}"
    echo "============================================="
    echo "count array keys   = ${!diceResult[@]}"
    echo "count array values = ${diceResult[@]}"
    echo "============================================="
    echo "in $n dice roll, you got $maxOccurredItem, $maxOccurrance times"
    echo "============================================="
}
answer01

# 2. Write a Program to generate a birth month of 50 individuals between the year 92 & 93. Find all the individuals having birthdays in the same month. Store it to finally print.
