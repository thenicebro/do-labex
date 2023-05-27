#!/usr/bin/env bash

error(){
    echo "Must have two numeric arguments" && exit 1
}

# sanitize input
[ $# -lt 2 ] && error
re='^[+-]?[0-9]+\.?[0-9]*$'
! [[ $1 =~ $re && $2 =~ $re ]] && error

distance=$(echo "sqrt($1^2"+"$2^2)" | bc -l)

if [ $(echo "$distance <= 1.0" | bc -l) -eq 1 ]; then echo 10 && exit 0; fi
if [ $(echo "$distance <= 5.0" | bc -l) -eq 1 ]; then echo 5 && exit 0; fi
if [ $(echo "$distance <= 10.0" | bc -l) -eq 1 ]; then echo 1 && exit 0; fi
if [ $(echo "$distance > 10" | bc -l) -eq 1 ]; then echo 0 && exit 0; fi






