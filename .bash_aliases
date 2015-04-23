#!/bin/bash
alias ls="ls -a --color"
alias ctagfull="ctags -R --sort=yes --extra=+q --fields=+aiS -f .tags"
alias xclip='xclip -selection c'
alias buildctagsdir="find * -type d -exec ~/dev/dirtags {} \; ; ctags -R --file-scope=yes *"
alias dirtags="~/dev/dirtags"
alias hugo="~/dev/projects/hugo/hugo"
alias delve="~/dev/source/gocode/src/github.com/derekparker/delve/cmd/dlv/dlv"
alias nvim="~/dev/source/neovim/nvim/install/bin/nvim" 
alias sudo='sudo '
alias projects="cd ~/dev/projects/"
export JDK_HOME="~/dev/source/jdk1.8.0_40"
export GOPATH=~/dev/source/gocode
export GOROOT=~/dev/source/go
export PATH=$PATH:$GOROOT/bin:"~/dev/source/jdk1.8.0_40/bin":"~/dev/source/vim/install/bin:/usr/local/cuda-7.0/bin"
export LD_LIBRARY_PATH=/usr/local/cuda-7.0/lib64:$LD_LIBRARY_PATH
function fsearch {
	((searchTerms = "${1/[[:space:]]?/%20}"))
	firefox -new-tab google.com/search?q=$searchTerms
}
