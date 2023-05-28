#!/usr/bin/env bash

decode(){
    input=$1; output=""; count=0; chr=""
    while [[ -n $input ]]; do
        [[ $input =~ ([0-9]*)([^0-9]) ]] && \
            count=${BASH_REMATCH[1]} && \
            if [[ -z $count ]]; then count=1; fi &&\
            chr=${BASH_REMATCH[2]} && \
            output+="$(repeat_let "$count" "$chr")" && \
            length=${#BASH_REMATCH[0]} && \
            input=${input:length}
    done
    echo "$output"
}

count_let(){
    count=$1; chr=$2
    [[ "$count" -eq 1 ]] && count=""
    echo "$count$chr"
}

repeat_let(){
    count=$1; chr=$2; output=""
    for ((c=1; c<=$count; c++)); do 
        result+="$chr"
    done
    echo "$result"
}

encode(){
    input=$1; output=""
    [[ -z "$input" ]] && exit 0
    count=0; chr=${input:0:1}
    for (( c=0; c<"${#input}"; c++ )); do
        if [[ ${input:c:1} == "$chr" ]] ; then
            ((count++)) 
        else
            output+="$(count_let "$count" "$chr")"
            chr=${input:c:1}
            count=1
        fi
    done

    output+="$(count_let "$count" "$chr")"

    echo "$output" && exit 0
}

main(){
    method=$1; input=$2
    [[ "$method" == 'encode' ]] && encode "$input"
    [[ "$method" == 'decode' ]] && decode "$input"
}

main "$@"
