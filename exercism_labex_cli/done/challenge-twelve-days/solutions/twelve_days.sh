#!/usr/bin/env bash

days=( null 'first' 'second' 'third' 'fourth' 'fifth' 'sixth' 'seventh' 'eighth' 'ninth' 'tenth' 'eleventh' 'twelfth' )

gifts=( null 'and a Partridge in a Pear Tree' 'two Turtle Doves' 'three French Hens' 'four Calling Birds' 'five Gold Rings' 'six Geese-a-Laying' 'seven Swans-a-Swimming' 'eight Maids-a-Milking' 'nine Ladies Dancing' 'ten Lords-a-Leaping' 'eleven Pipers Piping' 'twelve Drummers Drumming' )

function say_prefix(){
    day_num=$1 
    prefix="On the ${days[$day_num]} day of Christmas my true love gave to me: $(say_gifts $day_num)"
    [[ $day_num -eq 1 ]] && echo "${prefix}" | sed 's/and a Partridge/a Partridge/g' || echo "${prefix}"
}

function say_gifts(){
    verse_num=$1; verse=''
    while [[ $verse_num -ge 1 ]]; do
        [[ $verse_num -eq 1 ]] && verse+="${gifts[$verse_num]}" || verse+="${gifts[$verse_num]}, "
        ((verse_num--))
    done
    echo "$verse."
}

main(){
    start=$1; end=$2
    for ((v=$start; v<=$end; v++)){
        say_prefix $v
    }
}
main "$@"
