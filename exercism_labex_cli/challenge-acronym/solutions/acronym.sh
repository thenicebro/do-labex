#!/usr/bin/env

arglist=$(echo "$@" | tr '-' ' ') 
acronym=""


for word in ${arglist[@]}; do
  for char in ${word}; do
    acronym+=${char:0:1}
  done
done

echo ${acronym} | tr [:lower:] [:upper:]

