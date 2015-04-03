#!/bin/bash
alias ls="ls -a --color"
alias ctagfull="ctags -R --sort=yes --extra=+q --fields=+aiS -f .tags"
alias xclip='xclip -selection c'
alias buildctagsdir="find * -type d -exec dirtags {} \;"
alias dirtags="/home/chris/dev/dirtags"
export JDK_HOME="/home/chris/dev/source/jdk1.8.0_40"
export GOPATH=/home/chris/dev/source/gocode
export GOROOT=/home/chris/dev/source/go
export PATH=$PATH:$GOROOT/bin:"/home/chris/dev/source/jdk1.8.0_40/bin"
function fsearch {
	((searchTerms = "${1/[[:space:]]?/%20}"))
	firefox -new-tab google.com/search?q=$searchTerms
}
