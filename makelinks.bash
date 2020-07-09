#!/bin/bash

# 1) clone the repo to ~/homey
# git clone --origin cielgithub https://github.com/cielsys/homey homey
# 2) Run this script (need chmod u+x)

#homeyDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# TODO: figure out relative to home path

# Presumes dotfile links are to be created in and relative to ~ homeDir
cd ~
# And the actual files are in ~/homey
homeyDir=homey # Want to create relative path to home
echo "homeyDir="$homeyDir

# Define files that should be exposed as links in ~
dotFiles=".bashrc .bash_aliases .bash_profile .bash_emacs .emacs.d bin "

timeNow=`date '+%Y_%m_%dT%H_%M_%S'`;
bakDir=$homeyDir/backup/backup.$timeNow
if [ ! -e $bakDir ]; then
    mkdir -p $bakDir
fi

for file in $dotFiles; do
	# If it's a file (not a link)
	if [ -e $file ]; then
		mv $file  $bakDir
	fi

    echo "SymLinking  $homeyDir/$file $file"
    ln -s $homeyDir/$file $file
done
echo "Old files moved to $bakDir"
