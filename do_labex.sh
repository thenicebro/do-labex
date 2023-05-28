#!/bin/bash

src_path=~/myrepo/do-labex/exercism_bash-master
des_path=~/myrepo/do-labex/exercism_labex_cli

index_json(){

	# $1: ${des_path}/challenge-${src_name}/index.json 
	# $2: "${title_case}" 
	# $3: "${src_shell_name}" 
	# $4: "${src_testshell_correct_name}"
	
	# title
	sed -i "s/PastThere/$2/g" $1
	# solution
	sed -i "s/step1-solution.sh/$3/g" $1
	# host01
	sed -i "s/\"file\": \"test.sh\"/\"file\": \"${4}\"/g" $1
	sed -i "s/\"file\": \"response.sh\"/\"file\": \"${3}\"/g" $1
	
}

step1_md(){
	# $1: "${src_shell_name}" 
	# $2: ${des_path}/challenge-${src_name}/step1.md

	sed -i "s/acronym.sh/${1}/g" $2

}

title_name(){

	lower="of the in at a an about with"
	declare title=""

	for i in $1
	do
		if [[ $lower =~ $i ]];then
			title=$title" "$i
			continue
		fi
		
		upper=$(echo "${i:0:1}" | tr "[:lower:]" "[:upper:]")${i:1}
		title=$title" "$upper
	done
	echo $title

}

shell_test(){
	# $1: "${src_shell_name}" 
	# $2: ${des_path}/challenge-${src_name}/assets/${src_testshell_correct_name}
	sed -i "s/run bash ${1}/run bash \~\/project\/${1}/g" $2

}

for src_name in $(ls ${src_path})
do
	src_shell_name="${src_name//-/_}.sh"
	src_testshell_name="${src_name//-/_}_tests.sh"
	src_testshell_correct_name="${src_name//-/_}_test.sh"
	src_title_name="${src_name//-/ }"
	title_case=$(title_name "${src_title_name}")

	# copy test.sh and shell.sh into assets dir
      	cp ${src_path}/${src_name}/* ${des_path}/challenge-${src_name}/assets
      	
	# clear shell data
	echo "#!/usr/bin/env bash" > ${des_path}/challenge-${src_name}/assets/${src_shell_name}
	find ${des_path}/challenge-${src_name}/assets/ -type f -not -name "*.sh" -delete

	# copy solution.sh into solutions dir
	cp ${src_path}/${src_name}/${src_shell_name} ${des_path}/challenge-${src_name}/solutions
	find ${des_path}/challenge-${src_name}/solutions -type f -not -name "*.sh" -delete

	# edit setup.sh
	echo -e "#!/bin/zsh\n\nsudo apt install bats -y" > ${des_path}/challenge-${src_name}/setup.sh

	# organising the format of the shell
	if [[ -f ${des_path}/challenge-${src_name}/assets/${src_testshell_name} ]];then
		mv ${des_path}/challenge-${src_name}/assets/${src_testshell_name} ${des_path}/challenge-${src_name}/assets/${src_testshell_correct_name}
	fi

	# edit verify1.sh
	echo -e "#!/usr/bin/zsh\n\nbats -F junit /tmp/${src_testshell_correct_name}" > ${des_path}/challenge-${src_name}/verify1.sh

	# edit index.json 
	index_json ${des_path}/challenge-${src_name}/index.json "${title_case}" "${src_shell_name}" "${src_testshell_correct_name}"

	# edit step1.md
	step1_md "${src_shell_name}" ${des_path}/challenge-${src_name}/step1.md
	
	# edit path of test.sh
	shell_test "${src_shell_name}" ${des_path}/challenge-${src_name}/assets/${src_testshell_correct_name}

done
