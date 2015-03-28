colorscheme molokai
call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go'

call plug#end()
nmap <F8> :TagbarToggle<CR>
imap <c-Space> <esc>
nmap <C-J> <C-W>j<C-W>_
nmap <C-K> <C-W>k<C-W>_
nmap ,t :!(cd %:p:h;ctags *.[ch])&
nmap ,T :set tags=./tags,tags,~/dev/source/gocode/src/tags
filetype plugin on
set nu
