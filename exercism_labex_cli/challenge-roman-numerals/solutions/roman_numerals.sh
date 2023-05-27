#!/usr/bin/env bash

num=${1}

romans=( 'M' 'CM' 'D' 'CD' 'C' 'XC' 'L' 'XL' 'X' 'IX' 'V' 'IV' 'I')
integers=( 1000 900 500 400 100 90 50 40 10 9 5 4 1 )

result=''

for n in $(seq 0 $((${#integers[@]}-1)));
do
  count=$((num/integers[n]))
  if [ ${count} -ge 1 ]; then
      for ((i=1; i<=${count}; i++))
      do
          result+=$(printf "${romans[n]}%.0s" {1..${count}} )
      done
  else 
      result+=''
  fi
  ((num-=(integers[n]*count)))
done

echo ${result}





