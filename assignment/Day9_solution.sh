#!/bin/bash

# : '
# UC-0. Start with Displaying Welcome to Employee Wage Computation Program on Master Branch
# UC-1. Check Employee is Present or Absent
#     - Use ((RANDOM)) for Attendance Check
# UC-2. Calculate Daily Employee Wage
#     - Assume Wage per Hour is 20
#     - Assume Full Day Hour is 8
# UC-3. Add Part time Employee & Wage
#     - Assume Part time Hour is 8
# UC-4. Solving using Switch Case Statement
# UC-5. Calculating Wages for a Month
#     - Assume 20 Working Day per Month
# UC-6. Calculate Wages till a condition of total working hours or days is reached for a month
#     - Assume 100 hours and 20 days
# UC-7. Refactor the Code to write a function to get work hours
# UC-8. Store the Daily Wage along with the Total Wage
# UC-9. Store the Day and the Daily Wage along with the Total Wage
# '

WAGE_PER_HOUR=20
FULL_DAY=8

check_attendance() {
    echo $((RANDOM % 2))
}
daily_wage() {
    echo $(($WAGE_PER_HOUR * $FULL_DAY))
}

employee_wage() {
    isPresent=$(check_attendance)
    if [[ $isPresent -eq 1 ]]; then
        echo -e "Today, Employee earn \$$(daily_wage)"
    else
        echo -e "Today, Employee is on leave"
    fi
}

employee_wage
