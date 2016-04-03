#!/bin/bash
#Copies relevant files to the correct locations
#$1 should be dir to copy to
if [[ -n "$1" ]] && [ -d $1 ];
then
	for file in $( ls -A ../files/ ); do
		(cd ../files && ln -bs $(pwd)/$file $1/.$file)
	done
	exit
else
	echo "Must supply a directory to copy to. Suggest home directory of ~/"
fi
