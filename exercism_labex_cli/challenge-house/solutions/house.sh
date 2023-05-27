#!/usr/bin/env bash

actors=(
1 'the house that Jack built.'
'the malt' 'the rat' 'the cat'
'the dog' 'the cow with the crumpled horn'
'the maiden all forlorn'
'the man all tattered and torn'
'the priest all shaven and shorn'
'the rooster that crowed in the morn'
'the farmer sowing his corn'
'the horse and the hound and the horn'
)
verbs=(
1 'lay in' 'ate' 'killed' 'worried'
'tossed' 'milked' 'kissed' 'married'
'woke' 'kept' 'belonged to'
)

error(){ echo "invalid" && exit 1; }

recite(){
    verse=$1; last=$2; 
    msg=()
    msg+=$(printf "This is %s\n" "${actors[$verse]}")
    while [ "$verse" -gt 1 ] ; do
      msg+=$(printf "\nthat %s\n" "${verbs[$verse-1]} ${actors[$verse-1]}")
      ((verse--))
    done

    verse=$1  # reset the verse number
    for line in "${msg[@]}"; do
        [ $verse -ne $last ] && printf "%s\n\n" "$line" || printf "%s\n" "$line"
    done
}

main(){
    start=$1 ; last=$2
    [[ "$last" -ge "$start" ]] || error
    [ $start -gt 0 ] && [ $last -gt 0 ] || error
    [[ "$last" -gt 12 ]] && error
    while [[ "$last" -ge "$start" ]]; do
        recite "$start" "$last" 
        let start=$start+1
    done
}

main "$@"
