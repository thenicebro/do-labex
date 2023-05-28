#!/bin/bash

src_path=~/myrepo/do-labex/exercism_labex_cli
des_path=/home/sorria/myrepo/scenarios_linux/scenarios_linux/linux

for i in $(ls $src_path)
do

    cd $des_path
    git checkout -b $i
    cp $src_path/$i . -r
    mv $src_path/$i $src_path/done

    git add .
    sleep 1
    git commit -m "Add ${i}"
    
    sleep 1
    git push -u origin ${i}
    
    sleep 1
    git checkout master
done
