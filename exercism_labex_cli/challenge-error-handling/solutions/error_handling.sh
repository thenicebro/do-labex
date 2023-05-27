#!/usr/bin/env bash

set -e -u

who=${1}
usage='Usage: error_handling <who_to_greet>'

[ -z "$who" ] || [ $# -gt 1 ] && echo ${usage}  && exit 1

echo "Hello, ${who}" && exit 0
