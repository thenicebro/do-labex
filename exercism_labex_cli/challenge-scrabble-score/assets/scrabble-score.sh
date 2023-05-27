#!/usr/bin/env bash

word=`echo ${1} | tr [:upper:] [:lower:]`

characters=($(echo $word | grep -o .))

sum=0

for char in ${characters[@]}; do
    case ${char} in
        [aieoulnrst] ) ((sum+=1)) ;;
        [dg] ) ((sum+=2)) ;;
        [bcmp] ) ((sum+=3)) ;;
        [fhvwy] ) ((sum+=4)) ;;
        [k] ) ((sum+=5)) ;;
        [jx] ) ((sum+=8)) ;;
        [qz] ) ((sum+=10)) ;;
        * ) ((sum+=0)) ;;
   esac
done

echo "${sum}" || exit 1

exit 0
