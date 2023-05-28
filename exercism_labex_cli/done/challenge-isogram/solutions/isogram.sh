#!/usr/bin/env bash

input=${1}

input=$(echo ${input} | sed -e 's/[- ]//g' | tr '[:upper:]' '[:lower:]')

isisogram(){
  string=${1}
  length1=$( echo ${string} | fold -w1 | sort | uniq | wc -l )
  length2=$( echo ${string} | fold -w1 | wc -l )
  [[ ${length1} -eq ${length2} ]] && echo "true" && exit 0
  echo "false" && exit 0
}

isisogram ${input}
