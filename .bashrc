# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
#!/bin/bash
alias ls="ls -a --color"
alias ctagfull="ctags -R --sort=yes --extra=+q --fields=+aiS -f .tags"
alias xclipto='xclip -selection c'
alias xclipfrom="xclip -selection c -o"
alias buildctagsdir="find * -type d -exec ~/dev/dirtags {} \; ; ctags -R --file-scope=yes *"
alias dirtags="~/dev/dirtags"
alias hugo="~/dev/projects/hugo/hugo"
alias delve="~/dev/source/gocode/src/github.com/derekparker/delve/cmd/dlv/dlv"
alias nvim="~/neovim/bin/nvim"
alias sudo="sudo "
alias projects="cd ~/dev/projects/"
alias sources="cd ~/dev/source/"
alias cfx="~/dev/source/addon-sdk-1.17/bin/cfx"
alias vim="vimx"
alias ports="netstat -tulanp"
alias tmuxchris="~/dev/tmux_configs/chris_tmux.sh"
export ANT_HOME="/home/chris/dev/source/apache-ant-1.9.4"
export ANDROIDSDK="/home/chris/dev/source/android-sdk-linux/"
export ANDROIDNDK="/home/chris/dev/source/android-ndk-r10e/"
export ANDROIDNDKVER=r10e
export ANDROIDAPI=15
export JDK_HOME="/home/chris/jdk1.7.0_79"
export GOPATH=~/dev/source/gocode
export GOROOT=~/dev/source/go
export PATH=$PATH:$GOROOT/bin:"$JDK_HOME/bin":"~/dev/source/vim/install/bin:/usr/local/cuda-7.0/bin"
export LD_LIBRARY_PATH=/usr/local/cuda-7.0/lib64:$LD_LIBRARY_PATH
export WINEPREFX="/mnt/1TB/FED/.wine"
export WINEARCH="wine32"

set -o vi #Sets the editor commands to vi mode