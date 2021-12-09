#!/bin/bash -x

cat <<greatings
Date : 01/12/21
greatings

# Shell Scripting Started

cat <<Rules
variable declaration
========================================
> lowercase declaration (not mandatory)
> self declarative
> no special character
Rules

echo ''
echo "============================================="
echo "Arithmatic Operation"
echo "============================================="
num1=10
num2=20

sum=$(($num1 + $num2))
echo "result = $sum" # -> 30

sum1=$(expr $num1 + $num2)
echo "result = $sum1" # -> 30

sum2="expr $num1 + $num2"
echo "result = $sum2" # -> expr 10 + 20

sum3=$(expr $num1 + $num2)
echo "result = $sum3" # -> ''
echo "============================================="

echo "Add Opreation"
echo "============================================="
read -p 'insert a 1st number: ' num1
read -p 'insert a 2nd number: ' num2
# sleep 1
echo "result = $(expr $num1 + $num2)"
echo "result = $(($num1 + $num2))"
echo "============================================="
echo "this is a random value: $RANDOM"
