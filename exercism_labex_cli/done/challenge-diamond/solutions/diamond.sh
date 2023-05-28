#!/usr/bin/env bash

declare -a alphabet=( {A..Z} )

error(){ echo 'invalid input' && exit 1; }

get_index(){
    char=$1
    for (( i=0; i<${#alphabet[@]}; i++ )); do
        [[ $char == ${alphabet[$i]} ]] && echo $i && break
    done
}

make_space(){
    num=$1; local output=''
    for (( n=0; n<$num; n++ )); do
        output+=' '
    done
    echo "$output"
}

main(){
    [[ ! $1 =~ ^[A-Z]$ ]] && error
    char=$1; number=$(get_index $char); inner=' '; line=''; half_length=$number

    for (( i=0; i<=${number}; i++ )) {
        outter=$(make_space $half_length)
        [[ $i -lt 1 ]] && line="${alphabet[$i]}" && echo "$outter$line$outter" && half_length=$((--half_length)) && continue
        line="${outter}${alphabet[$i]}${inner}${alphabet[$i]}${outter}"
        echo "$line"
        inner+='  '
        half_length=$((--half_length))
    }
    inner=${inner%  }
    for ((i=$number-1; i>=0; i--)){
        inner=${inner%  }
        outter+=' '
        line="${outter}${alphabet[$i]}${inner}${alphabet[$i]}${outter}"
        [[ $i -lt 1 ]] && line="${outter}${alphabet[$i]}${outter}" && echo "$line" && continue
        echo "$line"
    }
    exit 0
}
main "$@"
