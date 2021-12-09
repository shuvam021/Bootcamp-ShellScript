#!/bin/bash -x

cat <<greatings
Date : 04/12/21
greatings

function something() {
    sum=$(($1 + $2))
    echo $sum
    return $sum
}

something 10 20
# echo $?
result=$(something 10 20)
# echo $result
