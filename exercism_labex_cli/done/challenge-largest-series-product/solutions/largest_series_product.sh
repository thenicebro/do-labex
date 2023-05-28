#!/usr/bin/env bash

echo "${BASH_VERSION}" | grep -e '^4.|^3.' 2>/dev/null && \
    echo "Need Bash Version 5.x" && exit 1

main(){
    numbers=$1
    length=$2
    # sanitize input and return appropriate errors
    [ "$numbers" == "" ] && echo "span must be smaller than string length" && exit 1
    [ -z "$numbers" -o -z "$length" ] && echo 1 && exit 0
    [ "$length" -lt 0 ] && echo "span must be greater than zero" && exit 1
    [ "${#numbers}" -lt "$length" ] && echo "span must be smaller than string length" && exit 1
    ( echo "$numbers" | grep -e '[a-z]' ) && echo "input must only contain digits" && exit 1

    max_product=0; product=1
    declare -a number_arr
    # populate a number array
    for (( num=0; num<${#numbers}; num++ )); do
        digit="${numbers:$num:1}"
        number_arr+=($digit)
    done
    # find max product for each span of $length within $number_arr
    for (( n=0; n<${#number_arr[@]}-$length+1; n++ )); do
        short_arr=( "${number_arr[@]:$n:$length}" )
        for (( short=0; short<"${#short_arr[@]}"; short++ )); do
            product=$(( $product*${short_arr[$short]} ))
        done
        [ "$product" -gt "$max_product" ] && max_product="$product"
        product=1
    done

    echo "$max_product"
}

main "$@"
