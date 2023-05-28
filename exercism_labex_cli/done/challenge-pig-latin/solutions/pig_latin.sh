#!/usr/bin/env bash
set -f

translate(){
    word=$1
    [[ ${word:0:1} =~ [aeiou] ]] && echo -n "${word}ay" && exit
    [[ ${word:0:3} =~ (squ|thr|sch) ]] && echo -n "${word:3}${word:0:3}ay" && exit
    [[ ${word:0:2} =~ (qu|rh|ch|sh|sk|th) ]] && echo -n "${word:2}${word:0:2}ay" && exit
    [[ ${word:0:2} =~ (yt|xr) ]] && echo -n "${word}ay" && return
    echo -n "${word:1}${word:0:1}ay" && return
}

main(){
    [[ $# -gt 1 ]] && for word in "$@"; do echo -n "$(translate $word) "; done | sed 's/ $//g'&& exit 0
    translate $1
    exit 0
}
main "$@"
