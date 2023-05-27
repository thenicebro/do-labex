#!/usr/bin/env bash

main(){
    sum=0; limit=$1; factors_arr=()
    shift
    for number in "$@" ; do
        [[ $number -eq 0 ]] && continue
        for (( i=1; i<$limit; i++ )) ; do
            [[ $(( $i % $number )) == 0 ]] && factors_arr+=( "$i" )
        done
    done
    # remove dupes
    factors_arr=($(for element in "${factors_arr[@]}"; \
    do echo "$element";done|sort|uniq|xargs))
    # get the sum
    for factor in "${factors_arr[@]}" ; do
        let sum=sum+factor
    done

    echo $sum
}

main "$@"

