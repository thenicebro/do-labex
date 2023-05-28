#!/usr/bin/env bash

# This script says "This is a leap year." if $1 is a leap year.
# Otherwise it says "This is not a leap year."

input=$1
truth="This is a leap year."
lie="This is not a leap year."
error="Usage: leap.sh <year>"
# Year must have four digits, no floats or alphas
re='^[0-9]{4}$'

if [ $# -ne 1 ] ; then   
	echo $error; exit 1
elif ! [[ $input =~ $re ]] ; then
	echo $error; exit 1
elif (( $input % 400 == 0 )) ; then
	echo $truth
elif (( $input % 100 == 0 )) ; then
	echo $lie
elif (( $input % 4 == 0 )) ; then
	echo $truth
else 
	echo $lie
fi
