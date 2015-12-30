#!/bin/bash
#Copies relevant files to the correct locations
#$1 should be dir to copy to
if [[ -n "$1" ]] && [ -d $1 ];
then
	cp ../.bashrc $1
	cp ../.vimrc $1
	cp dirtags $1
	cp ../.gitconfig_global $1/.gitconfig
	cp ../.tmux.conf $1
	cp ../.ctags $1
	cp ../.ycm_extra_conf.py $1
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	curl -fLo ~/.vim/colors/molokai.vim --create-dirs https://raw.githubusercontent.com/crr0004/molokai/master/colors/molokai.vim
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
	echo "Must supply a directory to copy to. Suggest home directory of ~/"
fi
