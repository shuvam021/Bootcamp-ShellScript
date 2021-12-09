#!/bin/bash

game() {
    cat <<game
Guese the magic no
game

    local magic_number=$(($RANDOM % 100))

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

game
