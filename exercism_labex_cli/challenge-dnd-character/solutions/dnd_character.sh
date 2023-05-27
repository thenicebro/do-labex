#!/usr/bin/env bash

declare -A abilities=( [strength]=0 [dexterity]=0 [constitution]=0 [intelligence]=0 [wisdom]=0 [charisma]=0 )

get_roll(){  # four simulated dice
    r1=$(( RANDOM % 6 + 1 )); r2=$(( RANDOM % 6 + 1 )); r3=$(( RANDOM % 6 + 1 ))
    r4=$(( RANDOM % 6 + 1 )); tot=0
    for n in $(echo "$r1 $r2 $r3 $r4" | grep -o . | sort -rn | head -3); do
        ((tot+=n))
    done
    echo "$tot"
}

generate(){
    for key in "${!abilities[@]}"; do
        abilities[$key]=$(get_roll)
        echo "$key ${abilities[$key]}"
    done
    echo "hitpoints $(hitpoints)"
}

modifier(){
    local constitution=$1
    [[ $((constitution%2)) -ne 0 ]] && ((constitution-=1))
    echo "$(((constitution-10)/2))"
}

hitpoints(){
    constitution_modifier=$(( (${abilities[constitution]}-10)/2 ))
    echo "$((constitution_modifier+10))"
}

main(){
    method=$1; [[ -n $2 ]] && score=$2 
    [[ $method =~ modifier ]] && modifier "$score"
    [[ $method =~ generate ]] && generate
    exit 0
}
main "$@"
