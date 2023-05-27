#!/usr/bin/env bash

input=${1}
power=${#input}
val=0

error(){
  echo "false" && exit 1
}

# No two-digit armstrong numbers...
[[ ${power} -eq 2 ]] && error

# create an iterator
arr=( $( echo ${input} | grep -o . ) )

for n in ${arr[@]}; do
    ((val+=n**${power}))
done

[[ ${val} -eq ${input} ]] && echo "true" && exit 0

error
