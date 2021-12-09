#!/bin/bash -x

cat <<greatings
Date : 02/12/21
greatings

<<Operators
= # equal
!= # not-equal
-z #operand size is 0
-n #operand size is not 0
str # not empty string

Relational Operators
(( ==, !=, >, >=, <, <= ))
[ -eq, -ne, -gt, -ge, -lt, -le ]

Logical Operators
&&, ||, !
-a, -o, !

Bitwise Operators:
&, |, ^, ~, <<, >>

[] is used with -eq, -ne, -gt, -ge, -lt, -le etc
(()) is used with ==, >, <, <=, >=, !=, etc
in case of [], combination of multiple conditional statement can be wrap with [[]]

File Test Operator
-b = block special file
-c = character special file
-d = directory exists or not
-e = file exists or not
-f = is a ordinary file
-g = Checks if file has its set group ID (SGID) bit set
-k = if file has its sticky bit set
-p = if file is a named pipe
-t = if file descriptor is open and associated with a terminal
-u = if file has its Set User ID (SUID) bit set
-r = file has read access or not
-w = file has write access or not
-x = file has execute access or not
-s = size of file, if gt 0 then True, else false
Operators

<<Question
Calculate emp salary for the day
if emp present => calculate salsry, if absent is 0
where
emp salary per hr is -20 rs
emp working hrs per day - 8hrs
Question
echo -e "\n"

emp_status=0
sal_unit='rs'
time_unit='hr'
working_per_day=8
salary_per_hr=20
emp_todays_working_hr=5

if [ $emp_status -eq 1 ]; then
    todays_salary=$(($salary_per_hr * $salary_per_hr))
    echo "$todays_salary $sal_unit for today"
else
    echo 'Employ is absent today'
fi

function if_condition() {
    empTotalSalary=0
    empSalaryPerHr=20
    empStatus=$(($RANDOM % 2))
    if [ $empStatus -eq 1 ]; then
        echo 'employee present'
        empWorkingHrsPerDay=$(($RANDOM % 4))
        if [ $empWorkingHrsPerDay -le 4 ]; then
            empTotalSalary=$(($empSalaryPerHr * 4))
            echo "Today employ worked for Half day"
        else
            empTotalSalary=$(($empSalaryPerHr * 8))
            echo "Today employ worked for Full day"
        fi
        echo "$empTotalSalary rs for today"
    else
        echo 'employee absent'
        echo "$empTotalSalary for today"
    fi
}

function switch_case() {
    read -p "Enter number: " standard
    case $standard in
    1)
        echo "Student is in $standard standard"
        ;;
    2)
        echo "Student is in $standard standard"
        ;;
    3)
        echo "Student is in $standard standard"
        ;;
    4)
        echo "Student is in $standard standard"
        ;;
    *)
        echo "Student doesn't belongs to the primary school"
        ;;
    esac
}

# if_condition
# switch_case
