#!/usr/bin/env bash

# Including the last test, this takes about 10.5 min on an i7-4700MQ laptop with 24G of memory
# and running Linux Mint 20.  Runs about 6m20s on my i5-6700K with 32G of memory running Arch.
# main2 & main3 do not provide all valid triplets necessary to pass the tests.  main & main1 do.
# using main(), all tests, even the 'large number' test, requires less than 6min on a slightly
# overclocked i7-6700k.

main(){
    for (( a=3; a<=$1/3; a++ )); do
        for (( b=a+1; b<=($1-a)/2; b++ )); do
            c=$(($1-a-b))
            if (( $a**2 + $b**2 == $c**2 )); then
                triplets+=( "$a,$b,$c" )
            fi
        done
    done
    for triplet in "${triplets[@]}"; do echo $triplet; done | sort -n
}

main1(){
    for (( a=0; a<=$1; a++ )); do
        for (( b=a+1; b<=$1-a; b++ )); do
            c=$(($1-a-b))
            if (( c>b && c**2 == a**2 + b**2 )); then
                triplets+=( "$a,$b,$c" )
            fi
        done
    done
    for triplet in "${triplets[@]}"; do echo $triplet; done | sort -n
}

main2(){
    declare -a triplet triplets
    declare -i a b c m n
    sqrt=$( bc <<< "scale=0; sqrt($1)" )
    for (( n=1; n<=sqrt; n++ )); do
        for (( m=n+1; m<=sqrt; m++ )); do
            a=$(( m**2 - n**2 ))
            b=$(( 2*m*n ))
            c=$(( m**2 + n**2 ))
            #echo "a,b,c: $a,$b,$c" | sort 
            #if (( a+b+c == $1 )); then
            if (( c>b && c**2 == a**2 + b**2 && a+b+c == $1 )); then
                triplet=( $a $b $c )
                IFS=$'\n' triplet=($(sort -n <<<"${triplet[*]}"))
                triplets+=( "${triplet[0]},${triplet[1]},${triplet[2]}" )
                #echo "triplet: ${triplet[@]}"
                unset IFS
            fi
        done
    done
    for triplet in "${triplets[@]}"; do echo $triplet; done | sort -n
}

main3(){
    declare -i limit=$1 a=0 b=0 c=0 m=2
    while (( c<limit )); do
        for (( n=1; n<m; n++ )); do
            a=$(( m*m - n*n ))
            b=$(( 2*m*n ))
            c=$(( m*m + n*n ))
            if (( c > limit )); then break; fi
            if (( c**2 == a**2 + b**2 && a+b+c == $1 )); then
                echo "$a,$b,$c"
            fi
        done
        m=$((++m))
    done
}
main "$@"
