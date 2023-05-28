#!/usr/bin/env bash

declare -A weekdays=( [sunday]=0  [monday]=1 [tuesday]=2 [wednesday]=3 [thursday]=4 [friday]=5 [saturday]=6 )

declare -a array_of_dates=()

get_weekday_dates(){
    indate=$(date +%F -d "$1")
    for n in $(seq 1 31); do
        if [[ $(date +%w -d "$indate") == ${weekdays[$2]} && $(date +%m -d "$indate") == $(date +%m -d "$1") ]] ; then
            array_of_dates+=( "$indate" ) 
        fi
        indate=$(date -d "$indate + 1 day")
    done
}

get_teenth(){
    outdate=$( date +%d -d "${array_of_dates[1]}" )
    [[ 10#$outdate -gt 12 && 10#$outdate -lt 20 ]] && echo "${array_of_dates[1]}" && return
    echo "${array_of_dates[2]}"
}

main(){
    yr=$1; month=$2; which=$3; weekday=${4,,}
    firstDate_of_month=$(date -d "${yr}-${month}-01")

    get_weekday_dates "$firstDate_of_month" "$weekday"

    declare -A ranges=( [first]=${array_of_dates[0]} [teenth]=$( get_teenth ) [second]=${array_of_dates[1]}
        [third]=${array_of_dates[2]} [fourth]=${array_of_dates[3]} [fifth]=${array_of_dates[4]} 
        [last]=${array_of_dates[-1]})
    
    date +%F -d "${ranges[$which]}"
}
main "$@"
