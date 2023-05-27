#!/usr/bin/env bash

type=${1}
# rather than use bc, let's just pretend they aren't floats...
side1=$(echo ${2} | sed -e 's/0\.//g')
side2=$(echo ${3} | sed -e 's/0\.//g')
side3=$(echo ${4} | sed -e 's/0\.//g')

error(){
  echo "false" && exit 1
}

# no zeros!
( [ ${side1} -eq 0 ] || [ ${side2} -eq 0 ] || [ ${side3} -eq 0 ] ) && error

# must be a triangle!
( [ $((side1+side2)) -le ${side3} ] || [ $((side2+side3)) -le ${side1} ]  || [ $((side1+side3)) -le ${side2} ] ) && error

# a function for each type of triangle...
equilateral(){
  if [ ${1} -eq ${2} ] && [ ${2} -eq ${3} ]; then
    echo true && exit 0
  else
    error
  fi
}

isoceles(){
  if [ ${1} -eq ${2} ] || [ ${2} -eq ${3} ] || [ ${1} -eq ${3} ]; then
    echo true && exit 0
  else
    error
  fi
}

scalene(){
  if [ ${1} -ne ${2} ] && [ ${2} -ne ${3} ] && [ ${1} -ne ${3} ]; then
    echo true && exit 0
  else
    error
  fi
}

# call the type of triangle from the parsed arg...
case ${type} in
    'equilateral')
        equilateral ${side1} ${side2} ${side3}  ;;
    'isosceles' )
        isoceles ${side1} ${side2} ${side3}  ;;
    'scalene' )
        scalene ${side1} ${side2} ${side3}  ;;
    * )
        echo "not a valid type of triangle"
esac


