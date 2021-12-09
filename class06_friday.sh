#!/bin/bash -x

cat <<greatings
Date : 03/12/21
greatings

# someVariable=1

read -p "input value: " input
echo '====================='

while (($someVariable <= $input)); do
    echo "$someVariable"
    someVariable=$(($someVariable + 1))
done

for ((counter = $input; $counter >= 1; counter--)); do
    if (($counter % 5 == 0)); then
        continue
    fi
    echo "$counter"
done
