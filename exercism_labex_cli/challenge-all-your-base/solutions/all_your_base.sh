#!/usr/bin/env bash

toBase10(){
    number=( $1 ); local -i total=0; inBase=$2
    length=$(( ${#number[@]}-1 ))
    for i in "${number[@]}"; do
        (( $i>=$inBase )) || (( $i<0 )) && return 1
        total+="$(( $i*($inBase**$length) ))"
        ((length--))
    done
    echo "$total"
}

fromBase10(){
    number=$1; outbase=$2
    (( $number <= 0 )) && \
        for (( i=${#targetBase[@]}-1; i>=0; i--)); do 
            echo -n "${targetBase[$i]} "; 
        done && return 
    targetBase+=( $(( $number % $outbase )) )
    fromBase10 $number/$outbase $outbase
}

main(){
    inBase=$1; outBase=$3; number=$2
    (( $inBase <= 1 || $outBase <= 1 )) && { echo "Only positive base numbers"; exit 1; }
    inBase10=$(toBase10 "$number" $inBase) || { echo "Invalid number" && exit 1; }
    targetBase=()
    echo $(fromBase10 "$inBase10" $outBase )
}
main "$@"
