#!/usr/bin/env bash

squareroot(){
    echo $1 | awk '{print sqrt($1)}'
}

squareroot "$@"
