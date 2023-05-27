#!/usr/bin/env bash

result=""
declare -A colorsToNumbers
colorsToNumbers=( [black]=0 [brown]=1 [red]=2 [orange]=3 [yellow]=4 [green]=5 [blue]=6 [violet]=7 [grey]=8 [white]=9 )

for color in $1 $2
do
    [[ ! -v colorsToNumbers[$color] ]] && echo "invalid color" && exit 1
    result+=${colorsToNumbers[$color]}
done
echo $result && exit 0
