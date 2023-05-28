#!/usr/bin/env bash


square_of_sums ()
{
    for ((n=1; n <= ${1}; n++))
    do
        ((sum=sum+n))
    done
    ((square=sum*sum))
    echo $square
}

sum_of_squares ()
{
    for ((n=1; n <= ${1}; n++))
    do
        ((sum=n*n+sum))
    done
    echo $sum
}

sq=$(square_of_sums $1)
sm=$(sum_of_squares $1)

case "$2" in
    "")
        ((ans=sq-sm))
        echo $ans
        exit 0;;
    "-S")
        echo $sq
        exit 0;;
    "-s")
        echo $sm
        exit 0;;
esac


