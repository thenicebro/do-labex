#!/usr/bin/env bash

error(){
    echo "Classification is only possible for natural numbers."
    exit 1
}

sum_factors(){
    local sum=0
    for ((n=1; n*2<=$1; n++)); do
        (( $1 % n == 0 && (sum+=n) )) 
    done
    echo "$sum"
}

main(){
    input_num=$1
    [[ $input_num -le 0 ]] && error 
    sum=$(sum_factors "$input_num")
    [[ "$sum" -eq "$input_num" ]] && echo "perfect"
    [[ "$sum" -lt "$input_num" ]] && echo "deficient"
    [[ "$sum" -gt "$input_num" ]] && echo "abundant" 
    exit 0
}

main "$@"
