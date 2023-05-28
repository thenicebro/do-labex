#!/usr/bin/env bash

prime_numbers=( $(factor {2..1000} | awk 'NF==2{print $2}') )

main(){
    let limit=$1; output=()
    for n in $(seq 2 $limit); do
        [[ " ${prime_numbers[@]} " =~ " $n " ]] && output+=( "$n" )
    done
    echo "${output[@]}"
}

main "$@"

