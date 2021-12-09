#!/bin/bash

# =====================================
# Helper methods
# =====================================
random_one_digit_value() {
    echo $(($RANDOM % 10))
}
random_two_digit_value() {
    val=$(($RANDOM % 100))
    if [ $val -lt 10 ]; then
        random_two_digit_value
    fi
    return $val
}
random_three_digit_value() {
    local val=$(($RANDOM % 1000))
    if [ $val -le 100 ]; then
        random_three_digit_value
    fi
    return $val
}

pickWeakDay() {
    echo $(($RANDOM % 6))
}

# =====================================
# Selection Practice Problems with if & else
# =====================================
# Q1. Write a program that reads 5 Random 3 Digit values and then outputs the minimum and the maximum value
answer1() {
    local maxValue=0
    local minValue=0

    for ((i = 1; i <= 5; i++)); do
        random_three_digit_value
        echo "val$i = $val"
        if (($val > $maxValue)); then
            maxValue=$val
        fi

        if (($minValue == 0)); then
            minValue=$val
        fi

        if (($val < $minValue)); then
            minValue=$val
        fi
    done

    echo "$maxValue, $minValue"
}

# Q2. Write a program that takes day and month from the command line and
# prints true if day of month is between March 20 and June 20, false otherwise.
answer2() {
    local TODAY_DAY=$(date +%d)
    local TODAY_MONTH=$(date +%m)
    if ((3 <= $TODAY_MONTH && $TODAY_MONTH <= 6)); then
        if (($TODAY_MONTH == 3 && $TODAY_DAY < 20)); then
            echo 'false'
        elif (($TODAY_MONTH == 6 && $TODAY_DAY > 20)); then
            echo 'false'
        else
            echo "true"
        fi
    else
        echo "false"
    fi
}

# Q3. Write a program that takes a year as input and outputs the Year is a Leap Year or
# not a Leap Year. A Leap Year checks for 4 Digit Number,
# Divisible by 4 and not 100 unless divisible by 400.
answer3() {
    local TODAY_YEAR=$(date +%Y)
    echo $TODAY_YEAR
    if (($TODAY_YEAR % 4 == 0 && $TODAY_YEAR % 400 == 0 && $TODAY_YEAR % 100 != 0)); then
        echo "leap year"
    else
        echo "not a leap year"
    fi
}

# Q4. Write a program to simulate a coin flip and print out "Heads" or "Tails" accordingly.
answer4() {
    if (($RANDOM % 2 == 0)); then
        echo "head"
    else
        echo "tail"
    fi
}

# =====================================
# Selection Practice Problems with if, elif and else
# =====================================
# Q5. Read a single digit number and write the number in word
answer5() {
    local value=$(random_one_digit_value)
    if [ $value -eq 1 ]; then
        echo 'ONE'
    elif [ $value -eq 2 ]; then
        echo 'TWO'
    elif [ $value -eq 3 ]; then
        echo 'THREE'
    elif [ $value -eq 4 ]; then
        echo 'FOUR'
    elif [ $value -eq 5 ]; then
        echo 'FIVE'
    elif [ $value -eq 6 ]; then
        echo 'SIX'
    elif [ $value -eq 7 ]; then
        echo 'SEVEN'
    elif [ $value -eq 8 ]; then
        echo 'EIGHT'
    elif [ $value -eq 9 ]; then
        echo 'NINE'
    else echo 'ZERO'; fi
}

answer5_2() {
    local value=$(random_one_digit_value)
    local arrayOfNumbers=(
        'ZERO'
        'ONE'
        'TWO'
        'THREE'
        'FOUR'
        'FIVE'
        'SIX'
        'SEVEN'
        'EIGHT'
        'NINE'
    )

    local arrayLength=${#arrayOfNumbers[@]}
    for ((counter = 0; counter < $arrayLength; counter++)); do
        if [ $value -eq $counter ]; then echo ${arrayOfNumbers[counter]}; fi
    done
}

# Q6. Read a Number and Display the week day (Sunday, Monday,...)
answer6() {
    arrayOfWeakdays=(
        'Sunday'
        'Monday'
        'Tuesday'
        'Wednessday'
        'Thursday'
        'Friday'
        'Saturday'
    )
    local value=$(random_one_digit_value)
    if [ $value -lt 7 ]; then
        echo ${arrayOfWeakdays[value]}
    else
        answer6
    fi
}

# Q7. Read a Number 1, 10, 100, 1000, etc and display unit, ten, hundred,...
answer7() {
    numbers=(1 10 100 1000)
    for item in ${numbers[@]}; do
        if (($item == 1)); then
            echo 'ONE'
        elif (($item == 10)); then
            echo 'TEN'
        elif (($item == 100)); then
            echo 'HUNDRED'
        elif (($item == 1000)); then
            echo 'THOUSAND'
        else
            echo 'NONE'
        fi
    done
}

# Q8. Enter 3 Numbers do following arithmetic operation and find the one that is maximum and minimum
# 1.(a + b * c) 3. (c + a / b)
# 2.(a % b + c) 4.(a * b + c)
answer8() {
    a=$RANDOM
    b=$RANDOM
    c=$RANDOM

    op1=$(($a + $b * $c))
    op2=$(($a % $b + $c))
    op3=$(($c + $a / $b))
    op4=$(($a * $b + $c))

    arrayOfOption=($op1 $op2 $op3 $op4)

    maxValue=${arrayOfOption[0]}
    minValue=${arrayOfOption[0]}

    for item in ${arrayOfOption[@]}; do
        if [ $maxValue -le $item ]; then
            maxValue=$item
        fi
    done

    for item in ${arrayOfOption[@]}; do
        if [ $minValue -ge $item ]; then
            minValue=$item
        fi
    done
    echo "from $op1, $op2, $op3, $op4 maximum is $maxValue and minimum is $minValue"
}

# =====================================
# Selection Practice Problems with case statement
# =====================================
# Q9. Read a single digit number and write the number in word using Case
answer9() {
    local value=$(random_one_digit_value)
    case $value in
    1)
        echo 'ONE'
        ;;
    2)
        echo 'TWO'
        ;;
    3)
        echo 'THREE'
        ;;
    4)
        echo 'FOUR'
        ;;
    5)
        echo 'FIVE'
        ;;
    6)
        echo 'SIX'
        ;;
    7)
        echo 'SEVEN'
        ;;
    8)
        echo 'EIGHT'
        ;;
    9)
        echo 'NINE'
        ;;
    *)
        echo 'ZERO'
        ;;
    esac
}

# Q10. Read a Number and Display the week day (Sunday, Monday,...)
answer10() {
    local value=$(pickWeakDay)
    case $value in
    '0')
        echo 'Sunday'
        ;;
    1)
        echo 'Monday'
        ;;
    2)
        echo 'Tuesday'
        ;;
    3)
        echo 'Wednessday'
        ;;
    4)
        echo 'Thursday'
        ;;
    5)
        echo 'Friday'
        ;;
    6)
        echo 'Saturday'
        ;;
    *)
        echo 'weakend'
        ;;
    esac
}

# Q11. Read a Number 1, 10, 100, 1000, etc and display unit, ten, hundred,...
answer11() {
    numbers=(1 10 100 1000)
    for item in ${numbers[@]}; do
        case $item in
        1)
            echo 'ONE'
            ;;
        10)
            echo 'TEN'
            ;;
        100)
            echo 'HUNDRED'
            ;;
        1000)
            echo 'THOUSAND'
            ;;
        *)
            echo 'NONE'
            ;;
        esac
    done
}

# Q12. Write a program that takes User Inputs and does Unit Conversion of different Length units
#     1.Feet to Inch  3. Inch to Feet
#     2.Feet to Meter 4. Meter to Feet
answer12() {
    #
    # ==============================
    # unit conversion
    # ==============================
    #
    case $1 in
    1)
        # 1ft=12in
        echo "$2ft -> $(echo "$2*12" | bc) in"
        ;;
    2)
        # 1ft = 0.3 m
        echo "$2ft -> $(echo "scale=2;$2*0.3" | bc) m"
        ;;
    3)
        # 1 in = 0.084 ft
        echo "$2in -> $(echo "scale=2;$2*0.084" | bc) ft"
        ;;
    4)
        #  1m = 3.28084 ft
        echo "$2m -> $(echo "scale=2;$2*3.28084" | bc) ft"
        ;;
    *)
        echo "..."
        ;;
    esac
}

# # # =====================================
# # # Results
# # # =====================================
# # =====================================
# # Selection Practice Problems with if & else
# # =====================================
# answer1
# answer2
# answer3
# answer4
# # =====================================
# # Selection Practice Problems with if, elif and else
# # =====================================
# answer5
# answer5_2
# answer6
# answer7
# answer8
# # =====================================
# # Selection Practice Problems with case statement
# # =====================================
# answer9
# answer10
# answer11
# answer12 4 54
