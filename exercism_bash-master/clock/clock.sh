#!/usr/bin/env bash

error(){ echo "invalid arguments" && exit 1; }

main(){
    [[ "$#" -gt 4 || "$#" -lt 1 || "$#" -eq 3 || "$3" =~ '/' ]] && error
    [[ "$1" =~ [a-z] || "$2" =~ [a-z] || "$4" =~ [a-z] ]] && error

    hours=$1*60*60; minutes=$2*60 
    [[ "$#" -gt 2 ]] && op=$3 && more_secs=$4*60
    [[ "$#" -gt 2 ]] && total_seconds=$((hours+minutes$op$more_secs)) \
        || total_seconds=$((hours+minutes))
    dateobj=$(date -d "today 00:00:00" )
    dateobj=$( date --date="$dateobj + $total_seconds seconds" +"%H:%M" )
    echo "$dateobj" 
}

main "$@"
