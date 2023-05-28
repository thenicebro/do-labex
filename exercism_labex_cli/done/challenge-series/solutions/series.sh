#!/usr/bin/env bash

length_err(){
    case $1 in
        1 ) echo "Error: slice length cannot be greater than series length" ;;
        2 ) echo "Error: slice length cannot be zero" ;;
        3 ) echo "Error: slice length cannot be negative" ;;
        4 ) echo "Error: series cannot be empty" ;;
    esac
    exit 1
}

main(){
   string=$1
   let length=$2
   [ -z $string ] && length_err 4
   [ $length -gt ${#string} ] && length_err 1
   [ $length -eq 0 ] && length_err 2
   [ $length -lt 0 ] && length_err 3
   start=0  
   end=$((start+length))
   out_arr=()

   while [ $end -le ${#string} ] ; do
      out_arr+=( "${string:start:length}" )
      ((start++))
      end=$((start+length))
   done

   echo "${out_arr[@]}"
}

main "$@"
