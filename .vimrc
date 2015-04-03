let mapleader = ","
" Changes the color scheme to a pleasent scheme
colorscheme molokai 
call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go' " Used for editing the golang language in vim

call plug#end()
nmap <F8> :TagbarToggle<CR> " Turns TagbarToggle on, check plugins for what this does
imap <Nul> <Space> " Ensures nul is mapped to space
imap <C-@> <Esc> " Changes ctrl space to escape insert mode
nmap <Leader>j <C-W>j " Moves down a split window
nmap <Leader>k <C-W>k " Moves up a split window
nmap <Leader>J <C-W>j<C-W>_ " Moves up a split window and makes it full screen
nmap <Leader>K <C-W>k<C-W>_ " Moves down a split window and makes it full screen
nmap <Leader>t :!(cd %:p:h;ctags *.[ch])& " Re-creates the ctags for the current file
nmap <Leader>T :set tags=./tags,tags,~/dev/source/gocode/src/tags " Sets the tag files so the local tag is looked first, then the next on up and so on until the global ctag file is found
filetype plugin on " Turns plugin filetype detection on
filetype on " The command filetype plugin on turns filetype detection on, however to ensure it is turned on
set nu " Sets line numbers on, change to rnu for relative line numbers
