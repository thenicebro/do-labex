#!/usr/bin/env bash

openers='^[[{(]$'
closers='^[]})]$'

say_true(){ echo 'true' && exit 0; }
say_false(){ echo 'false' && exit 0; }

main(){
    opened=''; closed=''; previous=''

    while read -n1 c; do
        [[ $c =~ $openers ]] && opened=$c$opened

        if [[ $c =~ $closers ]]; then
           
            previous="${opened:0:1}" && closed=$c$closed

            if [[ ($previous == '[' && $c == ']') || \
                ($previous == '(' && $c == ')') || \
                ($previous == '{' && $c == "}") ]]; then
                    opened="${opened:1}" && closed="${closed:1}"
            fi
        fi
    done <<< "$1"

    [[ ${#closed} -ne ${#opened} ]] && say_false
    [[ ${#opened} -eq 0 ]] && say_true || say_false
}
main "$@"
