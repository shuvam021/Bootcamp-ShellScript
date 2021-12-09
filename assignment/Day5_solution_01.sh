#!/bin/bash

# =====================================
# Helper methods
# =====================================

inch_to_feet() {
    echo "scale=3; $1 / 12" | bc
}

feet_to_meter() {
    # 3.34ft = 1m
    echo "scale=2;$1*3.34" | bc
}

sq_meter_to_acer() {
    echo "scale=2;$1*0.000247105" | bc
}

meter_to_acers() {
    # TODO: float value multiplication
    # 3.28084 foot = 1 meter
    return $(($1 * 3))
}

# =====================================
# Q and A
# =====================================
# Sequences Practice Problems
# =====================================

function answer1 {
    echo $((($RANDOM % 10) + 1))
}

function answer2 {
    echo $((($RANDOM % 6) + 1))
}

function answer3 {
    num1=$(answer2)
    num2=$(answer2)
    echo $(($num1 + $num2))
}

function answer4 {
    : '
    randomly pick 5 intigers
    =============================================
    get value from user
    TODO: check if input is an intiger
    TODO: check if input > 10 or not
    =============================================
    '
    result=0
    for ((i = 1; i <= 5; i++)); do
        random_two_digit_value
        value=$?
        echo "val$i = $value"
        result=$(($result + $value))
    done
    echo $result
}

function answer5 {
    echo "a). 1 ft = 12 in then 42in =  $(inch_to_feet 42.3654) ft"
    echo -e "\n"
    echo "b). Rectangular Plot of 60ft x 40 ft =$(feet_to_meter 60) x $(feet_to_meter 40) meter sq"
    echo -e "\n"
    x_side=$(feet_to_meter 60)
    y_side=$(feet_to_meter 64)
    area_in_sq_meter=$(echo "$x_side*$y_side" | bc)
    area_in_acer=$(sq_meter_to_acer $area_in_sq_meter)
    echo "c). area of 25 such plots $(echo "$area_in_acer*25" | bc) acers"
}

# answer1
# answer2
# answer3
# answer4
# answer5
