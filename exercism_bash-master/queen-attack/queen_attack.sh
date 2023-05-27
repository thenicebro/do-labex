#!/usr/bin/env bash

abs(){ echo $(( $1 < 0 ? -$1 : $1 )); } # get absolute value

main(){
    local -i w_row w_col b_row b_col

    while getopts :w:b: opt; do
        case $opt in
            w) IFS=, read -r w_row w_col <<< "$OPTARG" ;;
            b) IFS=, read -r b_row b_col <<< "$OPTARG" ;;
            *) echo "invalid option" && exit 1 ;;
        esac
    done
    # Handle errors
    [[ $w_row -lt 0 || $b_row -lt 0 ]] && echo "row not positive" && exit 1
    [[ $w_col -lt 0 || $b_col -lt 0 ]] && echo "column not positive" && exit 1
    [[ $w_row -gt 7 || $b_row -gt 7 ]] && echo "row not on board" && exit 1
    [[ $w_col -gt 7 || $b_col -gt 7 ]] && echo "column not on board" && exit 1
    [[ $w_col == $b_col && $w_row == $b_row ]] && echo "cannot occupy same position" && exit 1
    # diagonals
    local -i diag1=$( abs $(( w_row - b_row )) ) # if the absolute difference between rows and cols
    local -i diag2=$( abs $(( w_col - b_col )) ) # for white and black queens are equal, they share diagonal
    # can attack
    [[ $w_row == $b_row || $w_col == $b_col || $diag1 == $diag2 ]] && echo true && exit 0

    echo false
}
main "$@"
