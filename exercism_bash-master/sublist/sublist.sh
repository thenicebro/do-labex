#!/usr/bin/env bash

super(){ echo 'superlist' && exit 0; }
sub(){ echo 'sublist' && exit 0; }
equal(){ echo 'equal' && exit 0; }
notequal(){ echo 'unequal' && exit 0; }

main(){
    first=$(echo $1 | tr -d "[\[\],]")
    second=$(echo $2 | tr -d "[\[\],]")
    [[ -z $first  && -z $second ]] && equal
    [[ -z $first  && ! -z $second ]] && sub
    [[ -z $second  && ! -z $first ]] && super

    [[ "$first" == "$second" ]] && equal
    [[ "$second" =~ "$first" ]] && sub
    [[ "$first" =~ "$second" ]] && super
    notequal
}
main "$@"
