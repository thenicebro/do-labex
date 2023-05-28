#!/usr/bin/env bash

planet=$1
seconds=$2
earth_seconds=31557600

timeconvert(){
    pct_of_earth_orbit=$1
    result=`echo "scale=4; $seconds/($earth_seconds*$pct_of_earth_orbit)" | bc`
    printf %.2f $(echo $result | bc -l)
}

case $planet in
    'Earth')
        timeconvert 1  ;;
    'Mercury')
        timeconvert 0.2408467  ;;
    'Venus' )
        timeconvert 0.61519726 ;;
    'Mars' )
        timeconvert 1.8808158 ;;
    'Jupiter' )
        timeconvert 11.862615 ;;
    'Saturn' )
        timeconvert 29.447498 ;;
    'Uranus' )
        timeconvert 84.016846 ;;
    'Neptune' )
        timeconvert 164.79132 ;;
    * )
        echo 'not a planet' && exit 1;;
esac

exit 0
