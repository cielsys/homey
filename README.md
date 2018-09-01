# Homey
## My bash $HOME environment: .bashrc+, emacs, ~/bin, cheatsheets
New projects find me creating lots of new linux systems,
real, VM, cloud, embedded-ish... WSLUbuntu!
Homey is an attempt to enable quick duplication of my
bash environment etc and to enable rapid accumulation of new customizations.

This is not a shared project at this time. If you are looking for a
similar capability you are welcome to browse or comment but
you will probably be better off using with one of the existing, robust
dotfile cloning projects instead.
Rolling my own is part of re-honing rusted linux skills...
ie this thing is buggy!
Plus there are some other features that I want included.

## Overview
There are 4 major componenents of Homey
* Bash configuration files
* Emacs Environment
* Bin folder for scripts
* Notes folder for projects and cheatsheets

## Installation
Clone the repo to ~/homey/

    cd ~
    git clone --origin cielgithub https://github.com/cielsys/homey homey

Backup or delete the exisiting home files
Create ~ symbolic links to the repo version

    cd ~
    ln -s ~/homey/bashrc .bashrc
    ln -s ~/homey/bash_aliases .bmxash_aliases
    ln -s ~/homey/bash_emacs .bash_emacs

    ln -s ~/homey/.emacs.d .emacs.d
    ln -s ~/homey/bin bin

Or, when it's working right

    cd ~
    homey/makelinks.bash

... but there is a long way to go to get this working better.

## Todo
* Get this to work in windows WSL bash
    Especially see if can get windows Emacs properly integrated
* Add Notes html file.
* Add Emacs, bash cheatsheet to notes
* Try on Raspi, BBB
