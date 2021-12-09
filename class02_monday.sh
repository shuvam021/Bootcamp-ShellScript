#!/bin/bash

cat <<greatings
Date : 29/11/21
greatings

java filename.java
ctrl c = quit
ctrl z = pause
jobs = list all suspended process
fg %{job number} = resume a specific job in foreground
bg %{job number} = resume a specific job in background
ps -elf
kill -9
# ========================================
# awk & ps
# ========================================
ps -elf | grep "java" | grep -v "grep" | awk '{print $4}'
kill -9 $(ps -elf | grep "java" | grep -v "grep" | awk '{print $4}')

for file in $(ls *.txt); do
	folder_name=$(echo $file | awk -F "." '{print $1}')
	mkdir -p $folder_name
	mv $file ./$folder_name
done
