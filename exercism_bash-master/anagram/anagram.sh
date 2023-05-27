#!/usr/bin/env bash

word=${1}
options=${2}

answers=""

for w in $options
do
	[[ $(echo $w | tr "[:upper:]" "[:lower:]") == $(echo $word | tr "[:upper:]" "[:lower:]" ) ]] && continue
	a=$(echo $w | tr "[:upper:]" "[:lower:]" | grep -o . | sort | tr -d "\n")
	b=$(echo $word | tr "[:upper:]" "[:lower:]" | grep -o . | sort | tr -d "\n")
	[[ $a == $b ]] && answers+="$w "
done

echo $answers