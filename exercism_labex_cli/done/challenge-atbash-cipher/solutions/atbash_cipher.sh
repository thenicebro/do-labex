# atbash cipher example
method=${1}
input=${2}

input=`echo $input | sed 's/ //g' | tr -d '[:punct:]'`

case $method in
	'encode')  output=`echo $input | tr '[:upper:]' '[:lower:]' | tr '[abcdefghijklmnopqrstuvwxyz]' '[zyxwvutsrqponmlkjihgfedcba]' `
				echo $output | sed 's/.\{5\}/& /g'
				exit 0
				;;
	'decode')  output=`echo $input | tr '[:upper:]' '[:lower:]' | tr '[zyxwvutsrqponmlkjihgfedcba]' '[abcdefghijklmnopqrstuvwxyz]' `
				echo $output
				exit 0
				;;
	*)	echo 'bad input'
				exit 1
				;;
esac
		

