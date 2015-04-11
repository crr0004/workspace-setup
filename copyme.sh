#!/bin/bash
#Copies the vim and bash files
#$1 should be dir to copy to
if [[ -n "$1" ]] && [ -d $1 ];
then
	cp .bash_aliases $1
	cp .vimrc $1
	cp dirtags $1
	cp -r .vim $1
else
	echo "Must supply a directory to copy to. Suggest home directory of ~/"
fi
