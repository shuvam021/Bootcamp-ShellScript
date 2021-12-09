#!/bin/bash

readonly LOG_FiLE='./access.log'
readonly DATA_FiLE='./data.csv'

# Q1. Get user info from /etc/passwd and change ownership of users home directory (select userid higher than 1000)
answer01() {
    # a.)  View /etc/passwd'
    cat /etc/passwd | head -5

    # b). print the 1st field from /etc/passwd file
    cat /etc/passwd | head -1

    # c). print the 1st field from /etc/passwd file
    cat /etc/passwd | awk -F ":" '{ if ($3 > 1000) {print $1" "$3;}}'

    # d). Print the 2nd field to get home directory
    cat /etc/passwd | head -2 | tail -1

    # e). Use command substitution to get user list and home directory
    # ??

    # f). Change ownership of above home directory with user which is retrieve above
    # ??

    # g). Iterate above steps for all userid > 1000
    # ??
}

# Q2. Move files from one folder to the respective folders
answer02() {
    # a). Create files in current directory or any temporary directory - abc.txt def.txt ghi.txt jkl.txt
    touch abc.txt def.txt ghi.txt jkl.txt

    # b). Print list of files to move
    ls -al | grep '.txt'

    # c). Segregate basename and extension of a file.
    file_name_list=$(ls -al | grep '.txt' | awk '{print $9}' | awk -F . '{print $1}')

    # d). Create folder using basename.

    # e). Move file to newly created folder.
    for file in $(ls -p | grep '.txt' | grep -v 'awk'); do
        # separate extention
        file_name="${file%%.*}"
        echo $file_name
        if [ -f $file ]; then
            mkdir $file_name
            mv $file ./$file_name
        fi
    done

    # f). Iterate above steps for all files.
}

# Q3. Append current date to all log files name which has extension .log.1 from folder
answer03() {
    # a). Create files with name abc.log.1, def.log.1, ghi.log.1, jkl.log.1, mno.log.1
    mkdir log && cd $_
    touch abc.log.1 def.log.1 abc.log.1 ghi.log.1 jkl.log.1 mno.log.1
    cd ..

    # b). Print list of files to rename
    ls -l ./log/

    # c). Segregate base name and extension of a file
    echo 'moving srarted'
    cd ./logs
    for file in $(find . -name '*.log.1'); do
        folder=$(echo $file | awk -F / '{print $2}' | awk -F. '{print $1}')
        mkdir "./$folder" && mv $file $_ &>./solution.log
    done
    cd ..
    # d). Print Date Command to show in ddmmyy
    echo $(date '+%d%m%y') # ddmmyy

    # e). Append Date to log file name
    (date '+%d%m%y') >./solution.log

    # f). Iterate above steps for all files which has extension .log.1
}

# Q4. Archive the files from /var/log folder which have modified 7 dayes ago and move it to your backup folder
answer04() {
    # a). Identify files which have modified time greater than 7 days
    n=$((7 * 24))
    ls -al /var/log | find -mtime -$n -type f -name '*log*'

    # b). Move these files to the backup folder
    if [ -d ./backup ]; then
        mkdir ./backup
    fi
    cp $(ls -al /var/log | find -mtime -$n -type f -name '*log*') ./backup &>./solution.log
}

# Q5. Print last 4 frequently access urls count in sorted order from  /var/log/httpd/access.log
# a). View /var/log/httpd/access.log
# b). Print fields which has urls data
# c). Sort extracted urls and count it
# d). Print 4 unique urls
#         Expect sample output -
#             3458 /index.html
#              300 /api/swagger-ui.html
#              100 /favi.ico
#               20 /robots.txt
answer05() {
    [ -f $LOG_FiLE ] && open "$LOG_FiLE" || echo 'doesn'\''t exists'
    echo "$(grep -i 'http' $LOG_FiLE | awk '{print $11}' | sort -nr | uniq -c | sort | head -4)"
}

# Q6. Print last 4 frequently access unique urls at particular hours from /var/log/httpd/access.log
# a). View access.log without opening it using editor.
# b). Print urls which has given timestamp
# c). Sort extracted urls and count it
# d). Print 4 unique urls
#         Expect sample output -
#             3458 /index.html
#              300 /api/swagger-ui.html
#              100 /favi.ico
#               20 /robots.txt
answer06() {
    echo "$(grep -i 'http' $LOG_FiLE | awk '{print $11}' | sort -nr | uniq -c | sort | head -4)"
}

# Q7. Print list of web response code count in the unique sorted order at specific hours
answer07() {
    # a). View access.log without opening it using editor.
    # b). Print web response code filed which has given timestamp
    # c). Sort extracted response code and count it
    # d). Print 4 unique response code count
    #         Expect sample input -
    #             1000 200
    #              100 304

    [ -f $LOG_FiLE ] && cat "$LOG_FiLE" || echo 'doesn'\''t exists'
    echo "$(grep -i 'http' $LOG_FiLE | awk '{print $9}' | sort -nr | uniq -c | head -4)"
}

# Q8.Print list of last 10 unique sorted client IP from /var/log/httpd/access.log
answer08() {
    # a). View access.log without opening it using editor.
    # b). Print client ip field from access log
    # c). Sort extracted client IP and count it
    # d). Print 4 unique client IPs
    #         Expect sample input -
    #             3636 107.181.177.135
    #              423 27.62.203.44
    #               45 157.44.195.138
    #                4 157.39.158.255
    # [ -f $LOG_FiLE ] && cat "$LOG_FiLE" || echo 'doesn'\''t exists'
    echo "$(grep -i 'http' $LOG_FiLE | awk '{print $1}' | sort -nr | uniq -c | head -4)"
}
# Q9. Check if a folder exists or not. If it's not present, create it
answer09() {
    isExist=0
    # a). Test if perticular folder exists in curent directory or not
    if [ -d /testFolder ]; then
        echo 'folder already exists...'
        isExist=1
    else
        echo "folder doesn't already exists..."
    fi

    # b). If it's doesn't exists then create it else print "folder already exists..."
    if [ $isExist -eq 0 ]; then
        mkdir "./TestFolder"
    fi
}

# Q10. Execute command "hello" and "ls" and check its execution status and print whether command executed successful or not.
function answer10() {
    # a). Execute "hello" command at command prompt
    # sudo apt install hello
    hello

    # b). Check execution status of "hello" command
    hello 1>solution.log 2>solution.log
    hello &>>solution.log

    # c). Execute "ls" command at command prompt
    ls

    # d). Check execution status of "ls" command
    ls &>>solution.log
}

# Q11. Set environment usersecret="dH34xJaa23" if its already not set
answer11() {
    # # a). Check whether environment  variable usersecret assigned any value or not
    if [ -z "$(echo $usersecret)" ]; then
        echo 'Value is not assigned'
    else
        echo 'Value is assigned'
    fi

    # b). Print error if usersecret already set
    env_usersecret=$(printenv | grep -i 'usersecret')
    if [[ -z "$env_usersecret" ]]; then
        echo "Error: already exists"
    fi

    # c). Set environment variable usersecret to given value
    export usersecret="dH34xJaa23"
}

# Q. 12. Find a word "systemd" from all log files in the
# folder /var/log and print number of occurrence
# more than 0 against each file.
answer12() {
    # a). Use linux command to search word and print occurrence
    for file in $(ls -p | grep -v '/'); do
        wordCount=$(cat $file | grep -c 'systemd')
        if (($wordCount > 0)); then
            echo "$file, $(cat $file | grep -c 'systemd')"
        fi
    done

}

# Q13. Create process list table displays
# process id(PID), parent process id(PPID), command name(CMD), % of memory consumption, % of cpu utilization(C)
answer13() {
    ps -elf | awk '{print $4 "\t" $5 "\t" $13 "\t" $7 "\t" $6}'
}

# Q14. Data analysis / manipulation (Awk)
answer14() {
    # i). Print EmployeeName and TotalPay of who has BasePay greater than 10,000
    #     a). Read data file 'data.csv' from command line and extra rows which have BasePay > 10,000
    #     b[). Print only EmployeeName and totalPay
    cat "$DATA_FiLE" | awk '{ if ($2 > 10000) print $2"\t"$4;}'

    # ii). What is the aggregate TotalPay of employees whose jobtitle is 'CAPTAIN'
    #     a). Read data file 'data.csv' from command line and extract rows which have 'CAPTAIN' in the column 'jobtitle'
    #     b). Extract TotalPay and calculate sum. Print the result on terminal

    cat "$DATA_FiLE" | awk '{ if ($3 == "CAPTAIN") print $2"\t"$7;}'

    # iii). Print JobTitle and Overtimepay who has Overtimepay is between 7000 and 10000
    #     a). Read data file 'data.csv' from command line and extract jobtitle and overtimepay for column value range between 7000-10000
    cat "$DATA_FiLE" | awk '{ if ($5>=7000 && $5<=10000) print $2"\t"$3"\t"$7;}'
    #     b). Print average BasePay
    cat "$DATA_FiLE" | awk '{sum+=$4} END {print "Average BasePay =",sum/NR}'

    # iv). Print average BasePay
    #     a). Read data file 'data.csv' from command line and extract BasePay values and calculate its average
    #     b). Print the result on terminal
}

answer15() {
    # Q15. Find the difference between original file and updated file.
    # Apply changes to the original file.
    #     a). Create two directories as "original" and "updated"
    #     b). Copy given file 'original-file.sh' to the folder "original"
    #         and "updated-file.sh" to the folder "updated"
    #     c). Find the difference between these directories using linux command
    #     d). Make copy of folder "original" to some other directory
    #         as "original-backup" and apply changes to 'original-file.sh' file
    #     e). Verify that both folders "updated" and "original-backup" habe no
    #         difference
    echo "incomlete"
}

# ====================================================
# Function call
# ====================================================
# answer01
# answer02
# answer03
# answer04
# answer05
# answer06
# answer07
# answer08
# answer09
# answer10
# answer11
# answer12
# answer13
# answer14
# answer15
