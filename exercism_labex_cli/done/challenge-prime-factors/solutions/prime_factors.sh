#!/usr/bin/env bash

num=$1
factr=2
result=()
while [ $num -gt 1 ]; do

    if [  $((num % factr)) -eq 0 ]; then

        result+=($factr)

        (( num /= factr ))
    else
        (( factr++ ))
    fi
done
echo ${result[@]}
