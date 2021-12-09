#!/bin/bash -x

function folderCheck() {
    if [ -d $1 ]; then
        rm -r ./$1
    fi
}

touch abc.txt def.txt

for file in $(ls *.txt); do
    folderName=$(echo $file | awk -F. '{print $1}')
    folderCheck $folderName
    mkdir $folderName
    mv $file ./$folderName

    folderCheck $folderName # for cleaning generated files
done
