#!/usr/bin/env bash

alpha='abcdefghijklmnopqrstuvwxyz'
text=${1// /}

text=`echo $text | awk '{print tolower($0)}'`

for c in $( seq 1 ${#alpha} )
do
	[[ $text =~ ${alpha:c-1:1} ]]  || exit 1
done

exit 0

