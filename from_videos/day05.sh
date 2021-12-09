#!/bin/bash -x

function case01() {
    read -p "Enter first value : " x
    read -p "Enter second value : " y

    if [ $x -gt $y ]; then
        echo "first value is greater than second value"
    else
        echo "second value is greater than first value"
    fi
}

function case02() {
    isPresent=$((RANDOM % 3))
    echo "isPresent = $isPresent"
    perHourSalary=20
    workingHour=0
    if [ $isPresent -eq 0 ]; then
        echo "Employee is absent"
        workingHour=0
    elif [ $isPresent -eq 1 ]; then
        echo "Employee is present"
        workingHour=8
    else
        echo "Employee is working as part time"
        workingHour=4
    fi

    salary=$(($perHourSalary * $workingHour))
    echo "Employee has earned $salary $ today"
}

function case03() {
    for files in *; do
        ext=$(echo $files | awk -F. '{print $2}')
        case $ext in
        txt)
            echo "$files is text file"
            ;;
        java)
            echo "$files is java program file"
            ;;
        sh)
            echo "$files is shell script file"
            ;;
        *)
            echo "$files has $ext extension"
            ;;
        esac
    done
}

function case04() {
    isPresent=$((RANDOM % 3))
    perHourSalary=20
    workingHour=0
    case $isPresent in
    0)
        echo "Employee is absent"
        workingHour=0
        ;;

    1)
        echo "Employee is present"
        workingHour=8
        ;;

    2)
        echo "Employee is working as part time"
        workingHour=4
        ;;
    esac
    salary=$(($perHourSalary * $workingHour))
    echo "Employee has earned \$$salary today"
}

# case01
# case02
# case03
case04
