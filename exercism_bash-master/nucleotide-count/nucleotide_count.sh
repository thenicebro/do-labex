# count nucleotides by letter as parsed from $1

input=${1}
A=0; G=0; C=0; T=0;

error="Invalid nucleotide in strand"

for ((i=0;i<${#input};i++)); do
	char=`echo ${input:i:1}`;
	case ${char} in
		'A')  	((A++))
				;;
		'G')	((G++))
				;;
		'C')	((C++))
				;;
		'T')	((T++))
				;;
		*)		echo $error
				exit 1
				;;
	esac
done

# The test suite has two errors: shouldn't need chmod +x and output shouldn't need '$''
output="A: ${A}\nC: ${C}\nG: ${G}\nT: ${T}"

echo $output