#!/bin/bash

# 1) clone the repo to ~/homey
# git clone --origin cielgithub https://github.com/cielsys/homey homey
# 2) Run this script (need chmod u+x)


#dotFiles=".bashrc .bash_aliases .bash_emacs .emacs.d bin "
dotFiles=".test"

dotSrcDir=~/homey
bakDir=$dotSrcDir/backup/

if [ ! -e $bakDir ]; then
    mkdir $bakDir
fi
cd $dotSrcDir

for file in $dotFiles; do
	# If it's a file (not a link)
	if [ -f ~/$file ]; then
		mv ~/$file  $bakDir
	fi

    echo "SymLinking  $dotSrcDir/$file ~/$file"
    ln -s $dotSrcDir/$file ~/$file
done
echo "Old files moved to $dotSrcDir/backup"
