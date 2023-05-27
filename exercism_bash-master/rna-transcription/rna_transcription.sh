#!/usr/bin/env bash

G='C'
C='G'
T='A'
A='U'

input=$1
output=''

for i in $(seq 1 ${#input})
do
	# echo ${input:$i:1}. ## debugging
	if [ ${input:$i-1:1} == "G" ]
		then output+=$G
	elif [ ${input:$i-1:1} == "C" ]
		then output+=$C
	elif [ ${input:$i-1:1} == "T" ]
		then output+=$T
	elif [ ${input:$i-1:1} == "A" ]
		then output+=$A
	else
		echo "Invalid nucleotide detected."
		exit 1
	fi
done

echo $output