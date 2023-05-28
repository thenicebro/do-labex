#!/usr/bin/env bash

input=("$@")    # snarf the arguments

error(){
    echo "1 or 2 arguments expected" && exit 1
}

error1(){
    echo "Start must be greater than End" && exit 1
}

# throw an error if get too few or too many arguments
[[ ${#input[@]} -gt 0 && ${#input[@]} -lt 3 ]] || error
# check that verses are in right order
[[ ${#input[@]} -gt 1 && $1 -lt $2 ]] && error1

say_verse(){

    count1=$1
    count2=$((count1-1))
    singular="bottle"
    plural="bottles"
    verse2="Take one down and pass it around,"
    verse3="Go to the store and buy some more,"
	verse4="Take it down and pass it around,"
 
   if [[ $count1 -gt 2 ]]; then
        bottles1=${plural}
        bottles2=${plural}
    fi

    if [[ $count1 -eq 2 ]]; then
        bottles1=${plural}
        bottles2=${singular}
    fi
 
    if [[ $count1 -eq 1 ]]; then
        count2="no more"
		verse2=${verse4}
        bottles1=${singular}
        bottles2=${plural}
    fi

    if [[ $count1 -eq 0 ]]; then
        count1="no more"
        count2=99
        bottles1=${plural}
        bottles2=${plural}
        verse2=${verse3}
    fi

    verse="${count1} ${bottles1} of beer on the wall, ${count1} ${bottles1} of beer. \n${verse2} ${count2} ${bottles2} of beer on the wall.\n"

    printf "${verse^}"
}

# If the range is a single verse
[[ ${#input[@]} -eq 1 ]] && say_verse $input && exit 0;

# If the range is more than a single verse
while [[ $input -ge $2 ]]; do
    say_verse $input
    echo
    input=$((input-1))
done

exit 0
