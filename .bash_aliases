#!/bin/bash
alias ls="ls -a"
alias ctagfull="ctags -R --sort=yes --extra=+q --fields=+aiS -f .tags"
alias xclip='xclip -selection c'
alias buildctagsdir="find * -type d -exec dirtags {} \;"
alias dirtags="/home/chris/dev/dirtags"
export GOPATH=/home/chris/dev/source/gocode
export GOROOT=/home/chris/dev/source/go
export PATH=$PATH:$GOROOT/bin
function fsearch {
	((searchTerms = "${1/[[:space:]]?/%20}"))
	firefox -new-tab google.com/search?q=$searchTerms
}
