#!/usr/bin/env bash

function error(){
    [[ $1 -eq 1 ]] && echo "2 arguments expected" && exit 1
    [[ $1 -eq 2 ]] && echo "Start must be less than or equal to End" && exit 1
}

repeat="I know an old lady who swallowed a"
foods=( null 'fly'  'spider' 'bird' 'cat' 'dog' 'goat' 'cow' 'horse' )
comments=( null "I don't know why she swallowed the fly. Perhaps she'll die." 
    "It wriggled and jiggled and tickled inside her."
    "How absurd to swallow a bird!" "Imagine that, to swallow a cat!"
    "What a hog, to swallow a dog!" "Just opened her throat and swallowed a goat!"
    "I don't know how she swallowed a cow!" "She's dead, of course!" 
)

function bridge(){
    local -i current_verse_num=$1
    [[ $current_verse_num -eq 8 ]] && exit
    for ((v=$current_verse_num; v>=2; v--)); do
        [[ $v -ne 3 ]] && printf "She swallowed the %s to catch the %s\n" "${foods[$v]}" "${foods[$((v-1))]}." 
        [[ $v -eq 3 ]] && printf "She swallowed the %s to catch the %s that wriggled and jiggled and tickled inside her.\n" "${foods[$v]}" "${foods[$((v-1))]}"
        [[ $v -eq 2 ]] && printf "%s\n" "${comments[$((v-1))]}"
    done
}

function say_verse(){
    local -i this_verse=$1
    printf  "%s %s.\n%s\n%s" "$repeat" "${foods[$this_verse]}" "${comments[$this_verse]}" "$(bridge $this_verse)"
}

main(){
    local -i start=$1; local -i end=$2; lyrics=""
    [[ "$#" -ne 2 ]] && error 1
    [[ $2 -lt $1 ]] && error 2
    for (( v=$start; v<=$end; v++ )); do
        say_verse "$v" 
        [[ $v =~ 1 ]] && echo && continue
        [[ $v =~ 8 ]] && continue || echo && echo
    done
    exit 0
}
main "$@"
