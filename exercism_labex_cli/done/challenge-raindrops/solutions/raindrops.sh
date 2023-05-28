#!/usr/bin/env bash

# Wow!  I got wrapped around the axel on this in the first iteration!
# I didn't need to produce the factors after all!  Sheesh!

num=$1  # value to test
string=""

div_by () {
	if [[ $(( $num % $1 )) == 0 ]]; then
		return 0
	else
		return 1
	fi
}

div_by 3 && string+='Pling'
div_by 5 && string+='Plang'
div_by 7 && string+='Plong'

[[ -z $string ]] && string+=$num

echo $string


