#!/usr/bin/env bash

declare -A multiples
declare -a primes

main(){
    limit=$1
    for (( number = 2; number <= $limit; number++ )); do
        if ! [[ ${multiples[$number]} ]]; then
            primes+=( "$number" )
            for (( multiple = number*2; multiple <= $limit; multiple += number )); do
                (( multiples[$multiple] = 1 ))
            done
        fi
    done 
    echo "${primes[@]}"
}

main "$@"
