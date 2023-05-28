#!/usr/bin/env bash

declare -a directions=( 'north' 'east' 'south' 'west' )
declare -A bearings=( [north]=0 [east]=1 [south]=2 [west]=3 )

main(){
    [[ -z $1 ]] && EW=0 || EW=$1; 
    [[ -z $2 ]] && NS=0 || NS=$2; 
    [[ -z $3 ]] && bearing='north' || bearing=$3
    [[ -z $4 ]] && args='' || args=$4
    [[ "${!bearings[@]}" =~ $bearing ]] || { echo "invalid direction"; exit 1; }
    [[ -n $4 ]] && \
        for ((c=0; c<${#args}; c++)); do
        case ${args:$c:1} in
            'R') let "index = (${bearings[$bearing]} + 1) % 4" 
                bearing="${directions[$index]}" ;;
            'L') let "index = (${bearings[$bearing]} - 1) % 4"
                bearing="${directions[$index]}" ;;
            'A') case "$bearing" in
                    north ) ((NS++)) ;;
                    east ) ((EW++)) ;;
                    south ) ((NS--)) ;;
                    west ) ((EW--)) ;;
                esac
            ;;
             * ) echo "invalid instruction" && exit 1 ;;
        esac
    done

    echo "$EW $NS $bearing"
}
main "$@"
