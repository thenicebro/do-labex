#!/usr/bin/env bash

die(){ echo $1 && exit 1; }

declare -a up2_20=( 'zero' 'one' 'two' 'three' 'four' 'five' 'six' 'seven' 'eight' 'nine' 'ten' 'eleven'
'twelve' 'thirteen' 'fourteen' 'fifteen' 'sixteen' 'seventeen' 'eighteen' 'nineteen' 'twenty' )

declare -A twenty_90=( [20]='twenty' [30]='thirty' [40]='forty' [50]='fifty' [60]='sixty' [70]='seventy'
[80]='eighty' [90]='ninety' )


twenty_to_100() {
    local num=$1; s1="${num:0:1}"; s2=${num:1}
    echo "${twenty_90[$((s1*10))]}-${up2_20[s2]}" && exit 0
}

hundreds() {
    local num=$1; s1="${num:0:1}"; s2=${num:1} 
    [[ $((10#$s2)) -le 20 ]] && s2="${up2_20[$s2]}" || s2=$( twenty_to_100 "$s2" )
    [[ $num =~  ^(100|200|300|400|500|600|700|800|900)$ ]] && echo "${up2_20[s1]} hundred" && exit 0
    echo "${up2_20[s1]} hundred $s2" && exit 0
}

large_nums(){
    local -i num slice_size multiplier; local measurement; declare -a even_array=()
    num=$1; slice_size=$2; measurement=$3; multiplier=$4; length=$((${#num}-$slice_size))
    s1=${num:0:$length}; s2=${num: -$slice_size}

    [[ $s1 -le 20 ]] && s1=${up2_20[s1]} || s1=$( main "$s1" )  
    for ((i=0; i<=9; i++)){ even_array+=( $(( $i * $multiplier )) ); } 
    [[ "${even_array[@]}" =~ $num ]] && echo "$s1 $measurement" && exit 0
    s2=$( main "$((10#$s2))" ) && echo "$s1 $measurement $s2" && exit 0 
}

main(){
    declare -i num=$1
    [[ $num -lt 0 || $num -ge 1000000000000 ]] && die "input out of range"
    [[ $num -ge 0 && $num -le 20 ]] && echo "${up2_20[$num]}" && exit 0
    [[ $num -ge 20 && $num -lt 100 ]] && twenty_to_100 "$num"
    [[ $num -ge 100 && $num -lt 1000 ]] && hundreds "$num"
    [[ $num -ge 1000 && $num -lt 1000000 ]] && large_nums "$num" 3 'thousand' 1000
    [[ $num -ge 1000000 && $num -lt 1000000000 ]] && large_nums "$num" 6 'million' 10**6
    [[ $num -ge 1000000000 && $num -lt 1000000000000 ]] && large_nums "$num" 9 'billion' 10**9
}
main "$@"
