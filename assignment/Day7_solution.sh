#!/bin/bash

# =======================================
# Helper Methods
# =======================================
getRandom3() {
    local data=$(($RANDOM % 10 + 1))
    while (($data < 100)); do
        local data="$data$(($RANDOM % 10))"
    done
    echo $data
}

arrayOfN() {
    index=0
    arr=()
    while (($index < $1)); do
        arr[$index]=$(getRandom3)
        ((index++))
    done
    return ${arr[@]}
}
# =======================================
# Arrays Practice Problems
# =======================================

answer01() {
    # # 1. Write a program in the following steps
    # a. Generates 10 Random 3 Digit number.
    echo $(getRandom3)

    arrayOfNumber=()
    # b. Store this random numbers into a array.
    i=0
    while (($i < 3)); do
        arrayOfNumber[$i]=$(getRandom3)
        ((i++))
    done
    echo -e "value of array is \n ${arrayOfNumber[@]}"

    # c. Then find the 2nd largest and the 2nd smallest element without sorting the array.

    maxValue=${arrayOfNumber[0]}
    midValue=0

    for ((i = 0; i < ${#arrayOfNumber[@]}; i++)); do
        if (($maxValue < ${arrayOfNumber[i]})); then
            maxValue=${arrayOfNumber[i]}
        fi
    done
    echo "max value is $maxValue"

    for ((i = 0; i < ${#arrayOfNumber[@]}; i++)); do
        if ((${arrayOfNumber[i]} != $maxValue)); then
            if (($midValue < ${arrayOfNumber[i]})); then
                midValue=${arrayOfNumber[i]}
            fi
        else
            continue
        fi
    done

    echo "2nd max/mid value is $midValue"
}

# 2. Extend the above program to sort the array and then find the 2nd largest and the 2nd smallest element.
answer02() {
    # generate a array of n
    read -p "set array size: " n
    index=0
    newArray=()
    while (($index < $n)); do
        newArray[$index]=$(getRandom3)
        ((index++))
    done
    echo "random array = ${newArray[@]}"

    # selection sort
    lengthOfArray=${#newArray[@]}
    for ((i = 0; i < $lengthOfArray; i++)); do
        for ((j = i + 1; j < $lengthOfArray; j++)); do
            if ((${newArray[i]} > ${newArray[j]})); then
                temp=${newArray[i]}
                newArray[i]=${newArray[j]}
                newArray[j]=$temp
            fi
        done
    done
    echo "sorted array = ${newArray[@]}"
    echo "maxValue=${newArray[lengthOfArray - 1]}"
    echo "2nd maxValue=${newArray[lengthOfArray - 2]}"
    echo "2nd minValue=${newArray[1]}"
    echo "minValue=${newArray[0]}"
}

# 5. Take a range from 0 – 100, find the digits that are repeated twice like 33, 77, etc and store them in an array
answer05() {
    read -p "Q5.set range of digit: " n
    arr=()
    len=0
    for ((i = 1; i < $n; i++)); do
        digitOne=$(($i % 10))
        digitTwo=$((($i / 10) % 10))
        if (($digitOne == $digitTwo)); then
            arr[len]=$i
            ((len++))
        fi
    done
    echo ${arr[@]}
}

# answer01
# answer02
# answer05

# 3. Extend the Prime Factorization Program to store all the Prime Factors of a number n into an array and finally display the output.
# 4. Write a Program to show Sum of three Integer adds to ZERO
