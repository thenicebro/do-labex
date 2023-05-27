#!/usr/bin/env bash

num=${1}

err='Invalid number.  [1]NXX-NXX-XXXX N=2-9, X=0-9'

num=$( echo $num | tr -d '[^+1\.\(\)\[\]- ]' )

IFS='%'
[[ ${#num} -gt 11 ]] && echo $err && exit 1
[[ ${#num} -lt 10 ]] && echo $err && exit 1
[[ ${#num} -eq 11 ]] && [[ $(echo ${num:0:1} | grep -v '1') ]] && echo $err && exit 1
[[ ${#num} -eq 10 ]] && [[ $(echo ${num:3:1} | grep -v '[2-9]') ]] && echo $err && exit 1
unset IFS

echo $num
