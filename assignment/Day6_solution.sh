#!/bin/bash

# ========================================
# helper methods
# ========================================
# 0=No/false
# 1=Yes/true
checkPrimeNo() {
    local flag=1
    for ((i = 2; i <= $1 / 2; i++)); do
        if (($1 % $i == 0)); then
            flag=0
        fi
    done
    return $flag
}

checkPalindrom() {
    local flag=0
    local temp=$1
    local revNumber=''

    while (($temp > 0)); do
        revNumber="$revNumber$(($temp % 10))"
        temp=$(($temp / 10))
    done
    if [ $1 -eq $revNumber ]; then
        flag=1
    fi
    return $flag
}

# ========================================
# Day6 Prob01 For Loop Practice Problems
# ========================================
#
# Q1). Write a program that takes a command-line argument n
# and prints a table of the powers of 2 that are less than or equal to 2^n.

answer01() {
    read -p "Q1:insert a limit for table of 2: " n
    for ((i = 1; i <= $n; i++)); do
        echo "2^$i = $((2 ** $i))"
    done
}

# Q2). Write a program that takes a command-line argument n and prints the nth harmonic number. Harmonic Number is of the form
# Hn = 1/1 + 1/2 + 1/3 + 1/4 + ... + 1/n

answer02() {
    cat <<Formula
    Hn = 1/1 + 1/2 + 1/3 + 1/4 + ... + 1/n
Formula

    read -p "Q2:insert a value for n: " n
    total=0
    for ((i = 1; i < $n; i++)); do
        total=$(echo "scale=5;$total + (1/$i)" | bc)
    done
    echo $total
}

# Q3). Write a program that takes a input and determines if the number is a prime.
answer03() {
    read -p "Q3:insert a value for chacking prime or not: " n
    checkPrimeNo $n
    tempValue=$?
    if [ $tempValue -eq 1 ]; then
        echo "$n is a prime"
    else
        echo "$n is not a prime"
    fi
}

# Q4). Extend the program to take a range of number as input and output the Prime Numbers in that range.
answer04() {
    read -p "Q4: enter the range for prime number: " n
    for ((i = 1; i <= $n; i++)); do
        isPrime=1
        for ((j = 2; j <= $i / 2; j++)); do
            if (($i % $j == 0)); then
                isPrime=0
            fi
        done

        if [ $isPrime -eq 1 ]; then
            echo "$i"
        else
            continue
        fi
    done
}

# Q5). Write a program that computes a factorial of a number taken as input.
# 5 Factorial – 5! = 1 * 2 * 3 * 4 * 5
answer05() {
    read -p "Q5: insert a number for factorial: " n
    factorialValue=1
    for ((i = 1; i <= $n; i++)); do
        factorialValue=$(($factorialValue * $i))
    done

    echo $factorialValue
}

# Q6). Write a program to compute Factors of a number N using prime factorization method.
# Logic -> Traverse till i*i <= N instead of i <= N for efficiency.
# O/P -> Print the prime factors of number N.
answer06() {
    read -p "Please enter a number: " num
    ret=$(factor $num | cut -d " " -f 2)
    [ $ret -eq $num ] && echo "Yes" || echo "No"
}

# ========================================
# Day6 Prob02 While Loop Practice Problems
# ========================================
# Q7). Write a program that takes a command-line argument n and prints a
# table of the powers of 2 that are less than or equal to 2^n till 256 is
# reached..
answer07() {
    read -p "Q7:insert a limit for table of 2: " n
    iterator=1
    while [ $iterator -le $n ]; do
        echo "2^$iterator = $((2 ** $iterator))"
        ((iterator++))
    done
}

# Q8.
# Find the Magic Number
# a. Ask the user to think of a number n between 1 to 100
# b. Then check with the user if the number is less then n/2 or greater
# c. Repeat till the Magic Number is reached..
answer08() {
    cat <<game
Guese the magic no
game

    magic_number=$(($RANDOM % 100))

    while [ true ]; do
        read -p "Q8a:Oh Hei User, would you choose a no for me: " n
        if (($n == $magic_number)); then
            echo "hurray !!!"
            break
        else
            echo "ehhh ehhh..."
            echo "Hint: try $magic_number"
            continue
        fi
    done
}

# Q9). Extend the Flip Coin problem till either Heads or Tails wins 11 times.
answer09() {
    cat <<game
    Flip a coin
game

    headCount=0
    tailCount=0

    while (($headCount < 11 || $tailCount < 11)); do
        flip=$(($RANDOM % 2))
        if [ $flip -eq 1 ]; then
            headCount=$(($headCount + 1))
            echo -e "\tGot Head, and total Head count is $headCount"
        else
            tailCount=$(($tailCount + 1))
            echo -e "\tGot Tail, and total Tail count is $tailCount"
        fi
        read -p "Continue(y/n): " option
    done
    result="{\nhead = $headCount, \ntail : $tailCount\n}"
    echo -e "$result"
}

# Q10.
# Write a Program where a gambler starts with Rs 100 and places Re 1 bet
# until he/she goes broke i.e. no more money to gamble or reaches the
# goal of Rs 200. Keeps track of number of times won and number of bets
# made.
# '
answer10() {
    principalAmount=100
    flag=0
    while [ $principalAmount -gt 0 ]; do
        # echo "bet = 1 rs"
        ((flag++))
        echo "spent amount till now is $flag"
        ((principalAmount--))
    done
    echo "I'm broke now"
}

# ========================================
# Day6 Prob03 Functions Practice Problems
# ========================================
# Q11.
# Help user find degF or degC based on their Conversion Selection. Use
# Case Statement and ensure that the inputs are within the Freezing Point (
# 0 °C / 32 °F ) and the Boiling Point of Water ( 100 °C / 212 °F )
#     a. degF = (degC * 9/5) + 32
#     b. degC = (degF – 32) * 5/9

answer11() {
    echo "$@"

    case $1 in
    'f')
        temp=$(echo "scale=2; ($2*1.8)+32" | bc)
        echo $temp
        ;;
    'c')
        temp=$(echo "scale=2; ($2–32)*0.56" | bc)
        echo $temp
        ;;
    *)
        echo 'Invalid value'
        ;;
    esac
}

# Q12.
# Write a function to check if the two numbers are Palindromes

answer12() {
    read -p "insert a number: " n

    checkPalindrom $n
    isPalindrom=$?

    if [ $isPalindrom -eq 1 ]; then
        echo "number $n is a palindrom no."
    else
        echo "number $n is not a palindrom no."
    fi

}

# Q13.
# Take a number from user and check if the number is a Prime then show that its palindrome is also prime
#     a. Write function check if number is Prime
#     a).i.e if 121 is a prime number and is a palindrom value which is also 121.
#     b. Write function to get the Palindrome.
#       i.s. if ((81 == 18)) then
#               is a palindrom
#             else
#                   not
#              fi
#     c. Check if the Palindrome number is also prime

answer13() {
    read -p "Q13:insert a value for n: " n
    checkPrimeNo $n
    isPrime=$?
    checkPalindrom $n
    isPalindrom=$?
    # input is prime or not
    if [ $isPrime -eq 1 ]; then
        echo "number $n is a prime no."
    else
        echo "number $n is not a prime no."
    fi

    # input is palindrom
    if [ $isPalindrom -eq 1 ]; then
        echo "number $n is a palindrom no."
    else
        echo "number $n is not a palindrom no."
    fi

}

# ========================================
# function call
# ========================================
# Day6 Prob01 For Loop solution
# ========================================
# answer01
# answer02
# answer03
# answer04
# answer05
answer06

# ========================================
# Day6 Prob02 While Loop solution
# ========================================
# answer07
# answer08
# answer09
# answer10

# ========================================
# Day6 Prob03 Functions solution
# ========================================
# answer11 'f' 120
# answer12
# answer13
