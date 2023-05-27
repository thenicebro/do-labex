#!/usr/bin/env bash

items=( "$@" )
length=${#items[@]}
whitespace="[[:space:]]"
verse=""

for index in $(seq 0 $((length-1))); 
do
    [[ $var1 =~ $whitespace ]] && var1=\"${items[index]}\" || var1=${items[index]};
    [[ $var2 =~ $whitespace ]] && var2=\"${items[index+1]}\" || var2=${items[index+1]};

    if [ "$var2" != "" ]; then printf "%s\n" "For want of a $var1 the $var2 was lost."
    else printf "%s\n" "And all for the want of a ${items[0]}."
    fi
    var1=""; var2="";
done

exit 0;
