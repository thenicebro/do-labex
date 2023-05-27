#return word count for each word in a string
# Need to be running bash 4.x or greater!!


input=${1}
input=`echo $input|sed 's/,/ /g'`
input=`echo $input|sed 's/[.:,&@%$!^]//g' `
input=`echo $input | tr '[:upper:]' '[:lower:]' `
declare -A words
ouput=''

for word in $input; do
	[ ${words[$word]} ] && words[$word]=$((${words[$word]}+1))
	[ -z ${words[$word]} ] && words[$word]=$((1))
done

for k in ${!words[@]}; do
	output+="$k: ${words[$k]} "
done

echo $output