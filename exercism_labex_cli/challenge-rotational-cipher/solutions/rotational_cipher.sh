#!/usr/bin/env bash

lower=( {a..z} ); upper=( {A..Z} )

get_index(){
    char=$1
    [[ ${lower[@]} =~ $char ]] && for (( i=0; i<${#lower[@]}; i++ )); do
            if [ ${lower[$i]} = $char ]; then  echo "$i" ; fi
        done
    [[ ${upper[@]} =~ $char ]] && for (( i=0; i<${#upper[@]}; i++ )); do
            if [ ${upper[$i]} = $char ]; then  echo "$i" ; fi
        done
}

main(){
    string=$1; offset=$2; output=""
    for (( i=0; i<${#string}; i++ )); do
        char=${string:$i:1}
        [[ $char =~ [[:punct:]] || $char =~ [[:space:]] || \
            $char =~ [[:digit:]] ]] && output+="$char" && continue
        index=$( get_index "$char" )
        new_index=$(( (index+offset)%26 ))
        [[ ${upper[@]} =~ $char ]] && output+=${upper[$new_index]} \
            || output+=${lower[$new_index]}
    done
    echo "$output"
}
main "$@"
