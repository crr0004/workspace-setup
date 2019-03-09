#!/bin/bash
#Copies relevant files to the correct locations
#$1 should be dir to copy to
if [[ -n "$1" ]] && [ -d $1 ];
then
	sudo pip install powerline-status
	if [[ -e "$(which dnf)" ]];
	then
		su -c 'dnf install -y http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm'
		sudo dnf -y update && sudo dnf -y install vim-X11 tmux mpd ncmpcpp 
	fi
	./copyme.sh $1
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	curl -fLo ~/.vim/colors/molokai.vim --create-dirs https://raw.githubusercontent.com/crr0004/molokai/master/colors/molokai.vim
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
	echo "Must supply a directory to copy to. I Suggest home directory of ~/"
fi
