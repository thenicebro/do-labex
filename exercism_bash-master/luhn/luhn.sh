#!/usr/bin/env bash

# needs gnu rev to reverse string
input=$( echo ${1} | rev | tr -d ' ')


error(){
    # why does test look for 0 return status on failure????
    echo "false" && exit 0
}

# validate input
( [[ ${input} =~ ^[0-9]+$ ]] && [ ${#input} -gt 1 ] ) || error

# create an iterator
arr=($(echo $input | grep -o .))

sum=0
n=0   # index number for arr

for num in ${arr[@]};
do
  if [ $((n%2)) -ne 0 ]; then
    ((arr[n]=2*num))
    if [ ${arr[n]} -gt 9 ]; then
      ((arr[n]=arr[n]-9))
    fi
  fi
  ((sum+=arr[n]))
  ((n++))
done


( [ $((sum%10)) -eq 0 ] && echo "true" ) || error


