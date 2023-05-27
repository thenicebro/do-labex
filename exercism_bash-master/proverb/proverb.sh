#!/usr/bin/env bash

main(){
    local items=("$@")

    for ((i=0; i < $# - 1; i++)); do
        echo "For want of a ${items[i]} the ${items[i+1]} was lost."
    done

    if [ $# -gt 0 ]; then
        echo "And all for the want of a ${items[0]}."
    fi
}

main "$@"

