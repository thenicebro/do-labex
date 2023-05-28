#!/usr/bin/env bash

if [ -z "$1" ]; then who="you" 
else who=${1} 
fi

echo "One for ${who}, one for me."