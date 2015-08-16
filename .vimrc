let mapleader = " "
" Changes the color scheme to a pleasent scheme
colorscheme molokai
if !empty(glob("~/.vim/autoload/plug.vim"))

	call plug#begin('~/.vim/plugged')

	Plug 'SirVer/ultisnips' " UtilSnips engine
	Plug 'honza/vim-snippets' " Code snippets
	Plug 'Valloric/YouCompleteMe'
	Plug 'Lokaltog/vim-easymotion'
	Plug 'tmux-plugins/vim-tmux'
	Plug 'python-rope/ropevim', {'for': 'python'}
	Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
	Plug 'scrooloose/syntastic'
	Plug 'tpope/vim-fugitive'
	Plug 'eiginn/netrw' " Ensures I have latest version of netrw with my own modifications if I see fit
	Plug 'jeetsukumaran/vim-buffergator'


	call plug#end()

	nmap <F8> :TagbarToggle<CR> " Turns TagbarToggle on, check plugins for what this does

	let g:UltiSnipsExpandTrigger='<F9>'
	let g:UltiSnipsJumpForwardTrigger="<c-b>"
	let g:UltiSnipsJumpBackwardTrigger="<c-z>"
	let g:netrw_liststyle=0         " thin (change to 3 for tree)
	let g:netrw_banner=0            " no banner
	let g:netrw_altv=1              " open files on right
	let g:netrw_preview=1           " open previews vertically
	let g:netrw_browse_split = 4 " Open files in previous window

	let g:ycm_collect_identifiers_from_tags_files = 1 " YouCompleteMe collects from tag files. They must be created with --fields=+l
	let g:ycm_autoclose_preview_window_after_completion = 1 " Closes the YouCompleteMe window after the text is inserted
	let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

	let g:syntastic_cpp_checkers = ['gcc']
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*

	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 1
	let g:syntastic_check_on_open = 1
	let g:syntastic_check_on_wq = 0

	let g:buffergator_vsplit_size = 40
	let g:buffergator_hsplit_size = 20
	let g:buffergator_autoupdate = 1
	let g:buffergator_viewport_split_policy = "n"


else
	echom "Plugged not installed. Plugins not going to be loaded."
	echom "See https://github.com/junegunn/vim-plug for installation and usage"
	echom "Running install_plugged.sh in workspace-setup repo you got this from will install plugged"
endif
"imap <Nul> <Space> " Ensures nul is mapped to space
"imap <C-@> <Esc> " Changes ctrl space to escape insert mode
nmap <Leader>j <C-W>j " Moves down a split window
nmap <Leader>k <C-W>k " Moves up a split window
nmap <Leader>J <C-W>j<C-W>_ " Moves up a split window and makes it full screen
nmap <Leader>K <C-W>k<C-W>_ " Moves down a split window and makes it full screen
nmap <Leader>t :!(cd %:p:h;ctags *.[ch])& " Re-creates the ctags for the current file
nmap <Leader>T :set tags=./tags,tags " Sets the tag files so the local tag is looked first, then the next on up and so on until the global ctag file is found
nmap <Leader>w :w<CR> " Writes file
nmap <Leader>n :bn <CR> " Next buffer
nmap <Leader>p :bp <CR> " Previous buffer
nmap <Leader>` :call VexToggle("")<CR> " Opens netrw sidebar on the current file
map <F2> :mksession! ./.vim_session <cr> " Quick write session with F2
map <F3> :source ./.vim_session <cr>     " And load session with F3
imap <F5> <C-R>=strftime("%d-%m-%Y")<CR>
filetype plugin on " Turns plugin filetype detection on
filetype on " The command filetype plugin on turns filetype detection on, however to ensure it is turned on
au BufRead *.rs set filetype=rust
autocmd BufNewFile,BufRead *.md set filetype=markdown
set nu " Sets line numbers on, change to rnu for relative line numbers
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4 " Changes tab to 4 spaces
set backspace=indent,eol,start " Makes backspace actually work
set tags=./.tags,.tags
"
" " Make Vim recognize XTerm escape sequences for Page and Arrow
" " keys combined with modifiers such as Shift, Control, and Alt.
" " See http://www.reddit.com/r/vim/comments/1a29vk/_/c8tze8p
if &term =~ '^screen'
   " Page keys http://sourceforge.net/p/tmux/tmux-code/ci/master/tree/FAQ
	execute "set t_kP=\e[5;*~"
	execute "set t_kN=\e[6;*~"

   " Arrow keys http://unix.stackexchange.com/a/34723
	execute "set <xUp>=\e[1;*A"
	execute "set <xDown>=\e[1;*B"
	execute "set <xRight>=\e[1;*C"
	execute "set <xLeft>=\e[1;*D"
endif
"
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif
