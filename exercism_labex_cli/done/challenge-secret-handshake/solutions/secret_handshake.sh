#!/usr/bin/env bash

actions=( 'wink' 'double blink' 'close your eyes' 'jump' )
rev_arr=()

reverse(){ for i in "$@"; do rev_arr=( "$i" "${rev_arr[@]}" ); done }

main(){
    result=()
    count=0; num=$1; bits=''
    while [[  $num -ne 0 ]]; do
        (( $num & 1 )) && bits="1$bits" || bits="0$bits"
        [[ "${bits:0:1}" == "1" ]] && result+=("${actions[$count]}") 
        num=$(( num >> 1 )) && ((count++))
        [[ $count -gt 4 ]] && ((count=count%4)) 
    done
    if [[ $1 -ge 16 && "${#result}" -gt 1 ]] ; then
        reverse "${result[@]}" 
        printf ",%s" "${rev_arr[@]}" | sed 's/^,,//g'
        exit 0
    fi
    [[ "${#result}" -gt 1 ]] && printf ",%s" "${result[@]}" | \
        sed 's/^,//g' || echo "${result[@]}"
}
main "$@"
