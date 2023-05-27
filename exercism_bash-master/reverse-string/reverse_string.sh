#!/usr/bin/env bash

input=${1}
length=${#input}
reverse=""

for (( i=$length-1; i>=0; i-- )) 
do 
  reverse="$reverse${input:$i:1}"; 
done

echo $reverse