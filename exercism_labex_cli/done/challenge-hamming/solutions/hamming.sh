#!/usr/bin/env bash

first=$1
second=$2
distance=0

# No arguments, no execution...
if [[ $# -eq 0 ]]; then
	echo "Usage: hamming.sh <string1> <string2>"
	exit 1
fi

# Do they have the same character count?
if [ ${#first} -eq ${#second} ]
	then
	for ((i=0;i<${#first};i++)); do 
		if [ ${first:$i:1} != ${second:$i:1} ]; then 
			((distance++))   # so THIS is how you increment in bash!
		fi
	done
else
	echo "The two strands must have the same length."
	exit 1
fi

echo $distance