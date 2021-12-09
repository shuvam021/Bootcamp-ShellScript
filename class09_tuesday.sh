#!/bin/bash -x

cat <<greatings
Date : 07/12/21
greatings
echo -e "\n"

declare -A sounds
sounds[dog]='bark'
sounds[cat]='meow'
sounds[wolf]='howl'
sounds['cow']='moo'
# =====================================
echo ${!sounds[@]}  # -> keys
echo ${sounds[@]}   # -> values
echo ${sounds[dog]} # -> 1 element
echo ${#sounds[@]}  # -> length
unset sounds[dog]   # -> delete element
echo ${sounds[@]}   # -> values
echo sounds[dog]    # -> unwanted data
