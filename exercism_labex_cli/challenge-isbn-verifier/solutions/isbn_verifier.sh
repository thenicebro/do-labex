#!/usr/bin/env bash

error(){
    echo "false" && exit 0
}

main(){
    position_num=10; declare -i product; product=0

    input_arr=(`echo $1 | sed 's/[ -]//g' | grep -o .`)

    length=${#input_arr[@]}; (( $length != 10 )) && error

    end_char=${input_arr[$length-1]}  
    [[ "012345677890X" =~ $end_char ]] || error

    for num in ${input_arr[@]} ; do
        [ $num == 'X' ] && [ $position_num == 1 ] && num=10  # convert 'X' 
        # test for non-numbers
        [ -n "$num" ] && [  "$num" -eq "$num" ] 2>/dev/null || error
        product+=$((position_num*num))
        ((position_num--))
    done

    (( product % 11 == 0 )) && echo 'true' || error
    return 0
}

main "$@"

