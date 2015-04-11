let mapleader = ","
" Changes the color scheme to a pleasent scheme
colorscheme molokai 
call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go', { 'for': 'go' } " Used for editing the golang language in vim
Plug 'SirVer/ultisnips' " UtilSnips engine
Plug 'honza/vim-snippets' " Code snippets
Plug 'Valloric/YouCompleteMe'
Plug 'crr0004/netrw' " Ensures I have latest version of netrw with my own modifications if I see fit
Plug 'Lokaltog/vim-easymotion'

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
nmap <Leader>w :w<CR> " Writes file
nmap <Leader>< <^ " Indents starting of the line left
nmap <Leader>> >^ " Indents starting of the line right
nmap <Leader>n gt " Next tab
nmap <Leader>p gT " Previous tab
nmap <Leader>` :call VexToggle("")<CR> " Opens netrw sidebar on the current file
filetype plugin on " Turns plugin filetype detection on
filetype on " The command filetype plugin on turns filetype detection on, however to ensure it is turned on
set nu " Sets line numbers on, change to rnu for relative line numbers
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:netrw_liststyle=0         " thin (change to 3 for tree)
let g:netrw_banner=0            " no banner
let g:netrw_altv=1              " open files on right
let g:netrw_preview=1           " open previews vertically
let g:netrw_browse_split = 4 " Open files in previous window

let g:ycm_collect_identifiers_from_tags_files = 1 " YouCompleteMe collects from tag files. They must be created with --fields=+l
let g:ycm_autoclose_preview_window_after_completion = 0 " Closes the YouCompleteMe window after the text is inserted
