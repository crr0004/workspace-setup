#!/bin/bash
#Copies relevant files to the correct locations
#$1 should be dir to copy to
if [[ -n "$1" ]] && [ -d $1 ];
then
	cp .bashrc $1
	cp .vimrc $1
	cp dirtags $1
	cp .gitconfig_global $1
	cp .tmux.conf $1
else
	echo "Must supply a directory to copy to. Suggest home directory of ~/"
fi
