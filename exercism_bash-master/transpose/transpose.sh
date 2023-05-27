#!/usr/bin/env bash

main(){
    readarray -t lines
    line_count=${#lines[@]} 
    max_length=${#lines[line_count-1]}

    for (( i=line_count-2; i>=0; i-- )); do
        while [[ ${#lines[i]} -lt ${#lines[i+1]} ]]; do
            lines[i]="${lines[i]} "
        done
        [[ ${#lines[i]} -gt $max_length ]] && max_length=${#lines[i]}
    done
    
    for (( i=0; i<$max_length; i++ )); do
        transposed=""
        for line in "${lines[@]}"; do
            transposed+=${line:i:1}
        done
        echo "$transposed"
    done
}
main "$@"

