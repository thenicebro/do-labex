#!/usr/bin/env bash

declare -a letters=($(echo {a..z}))

get_index(){
    letter=$1
    for (( index=0; index<"${#letters[@]}"; index++ )); do
        [[ "${letter}" = "${letters[$index]}" ]] && echo $index
    done
}

get_char(){ echo "${letters[$1]}"; }

gcd(){   # greatest common divisor
    m=$1
    [ "$2" -lt "$m" ] && m="$2"
    while [ "$m" -ne 0 ]; do
        x=$(expr $1 % $m); y=$(expr $2 % $m)
        [ "$x" -eq 0 -a "$y" -eq 0 ] && echo "$m" && break
        m=$(expr $m - 1)
    done
}

get_mmi(){
    orig_index=$1
    for n in {0..26}; do
        [[ $(((($orig_index*$n))%26)) -eq 1 ]] && echo $n && break || continue
    done
}

encode(){
    key_a=$1; key_b=$2; input=$3; output=""
    for (( i=0; i<${#input}; i++ )) ; do
        char="$( echo ${input:$i:1})"
        orig_index=$(get_index "$char")
        [[ ! "$char" =~ [0-9] ]] && \
            substitution=$((($key_a*$orig_index+$key_b)%26))\
            && output+="${letters[$substitution]}"\
            || output+="$char" 
    done
    echo "$output" | sed 's/.\{5\}/& /g' | awk '{$1=$1;print}' && exit 0
}

decode(){
    key_a=$1; key_b=$2; input=$3; output=""
    a_mod_m=$(( $key_a%26 ))
    mmi=$( get_mmi $a_mod_m ) 
    for (( i=0; i<${#input}; i++ )) ; do
        char="$( echo ${input:$i:1})"
        orig_index=$(get_index "$char")
        [[ ! "$char" =~ [0-9] ]] && \
            new_index=$(($mmi*(($orig_index-$key_b))%26)) &&\
            if [ "$new_index" -lt 0 ] ; then new_index=$((26+$new_index)); fi &&\
            substitution="${letters[$new_index]}" &&\
            output+="$substitution"\
            || output+="$char" 
    done
    echo "$output" | sed 's/ //g' | awk '{$1=$1;print}' && exit 0
}

main(){
    method=$1; key_a=$2; key_b=$3

    val1=$(gcd "$key_a" "26")
    ! [[ "$val1" -eq 1 ]] && echo "a and m must be coprime." && exit 1

    input="$( echo "$4" | tr '[:upper:]' '[:lower:]' | \
        tr -d '[:punct:]' | tr -d '[:space:]' )"
    [ "$method" == 'encode' ] && encode $key_a $key_b $input
    [ "$method" == 'decode' ] && decode $key_a $key_b $input
}
main "$@"
