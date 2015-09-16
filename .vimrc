let mapleader = " "
" Changes the color scheme to a pleasent scheme
colorscheme molokai
if !empty(glob("~/.vim/autoload/plug.vim"))

	call plug#begin('~/.vim/plugged')

	Plug 'SirVer/ultisnips' " UtilSnips engine
	Plug 'honza/vim-snippets' " Code snippets
	Plug 'Shougo/neocomplete.vim'
	Plug 'tmux-plugins/vim-tmux'
	Plug 'python-rope/ropevim', {'for': 'python'}
	Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
	Plug 'scrooloose/syntastic'
	Plug 'eiginn/netrw' " Ensures I have latest version of netrw with my own modifications if I see fit
	Plug 'jeetsukumaran/vim-buffergator'
	Plug 'kien/ctrlp.vim'
	Plug 'majutsushi/tagbar'


	call plug#end()

	nmap <F8> :TagbarToggle<CR> " Turns TagbarToggle on, check plugins for what this does
	let g:tagbar_compact = 1

	let g:neocomplete#enable_at_startup = 1

	let g:UltiSnipsExpandTrigger='<F9>'
	let g:UltiSnipsJumpForwardTrigger="<c-b>"
	let g:UltiSnipsJumpBackwardTrigger="<c-z>"
	let g:netrw_liststyle=0         " thin (change to 3 for tree)
	let g:netrw_banner=0            " no banner
	let g:netrw_altv=1              " open files on right
	let g:netrw_preview=1           " open previews vertically
	let g:netrw_browse_split = 4 " Open files in previous window

	let g:syntastic_cpp_checkers = ['gcc']

	let g:syntastic_cpp_check_header = 1

	let g:buffergator_vsplit_size = 40
	let g:buffergator_hsplit_size = 20
	let g:buffergator_autoupdate = 1
	let g:buffergator_viewport_split_policy = "n"


else
	echom "Plugged not installed. Plugins not going to be loaded."
	echom "See https://github.com/junegunn/vim-plug for installation and usage"
	echom "Running install_plugged.sh in workspace-setup repo you got this from will install plugged"
endif
" Mappings
	" Swaps scroll commands for easier ergonimcs
	nnoremap <C-f> :call ScrollDownPercent(33)<CR>
	nnoremap <C-b> :call ScrollUpPercent(33)<CR>
	" Moves down a split window
	nmap <Leader><Space> za
	vmap <Leader><Space> zf
	" Moves through split window
	nmap <Leader>j <C-W>j<C-R>
	nmap <Leader>k <C-W>k<C-R>
	nmap <Leader>h <C-W>h<C-R>
	nmap <Leader>l <C-W>l<C-R>
	" Moves through split window and makes it full screen
	nmap <Leader>J <C-W>j<C-W>_ 
	nmap <Leader>K <C-W>k<C-W>_ 
	nmap <Leader>L <C-W>l<C-W>_ 
	nmap <Leader>H <C-W>h<C-W>_ 
	"Remap leader to yank and put from system clipboard
	vmap <Leader>y "+y
	vmap <Leader>d "+d
	nmap <Leader>p "+p
	nmap <Leader>P "+P
	vmap <Leader>p "+p
	vmap <Leader>P "+P
	" Re-creates the ctags for the current file
	nmap <Leader>t :!(cd %:p:h;ctags *.[ch])& 
	" Writes file
	nmap <Leader>w :w<CR> 
	" Next buffer
	nmap <Leader>n :bn <CR> 
	" Previous buffer
	nmap <Leader>p :bp <CR> 
	" Opens netrw sidebar on the current file
	nmap <Leader>` :call VexToggle("")<CR>
	" Quick write session with F2
	map <F2> :mksession! ./.vim_session <CR> 
	" And load session with F3
	map <F3> :source ./.vim_session <CR>     
	map <F4> :lgrep -e " . expand("<cword>") . " "
" Options
	filetype plugin on " Turns plugin filetype detection on
	filetype on " The command filetype plugin on turns filetype detection on, however to ensure it is turned on
	au BufRead *.rs set filetype=rust
	autocmd BufNewFile,BufRead *.md set filetype=markdown
	autocmd BufNewFile,BufRead *.py call SetPythonOptions()
	set nu " Sets line numbers on, change to rnu for relative line numbers
	set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4 " Changes tab to 4 spaces
	set backspace=indent,eol,start " Makes backspace actually work
	set tags=./.tags,.tags
	"Folding with syntax highlighting
	set foldmethod=syntax
	"Fix external grep
	set grepprg=grep\ -rnEI\ --exclude-dir=.git\ $*\ /dev/null

" Functions
	function! SetPythonOptions()
		set foldmethod=indent
		set foldnestmax=2
		set tabstop=2 softtabstop=0 expandtab shiftwidth=2 " Changes tab to 4 spaces
	endfunction

	function! GetScrollPercent(percent)
		let movelines=winheight(0)*(50-a:percent)/100
		if has('float') && type(movelines)==type(0.0)
			let movelines=float2nr(movelines)
		endif
		return movelines
	endfunction
	function! ScrollDownPercent(percent)
		let movelines=GetScrollPercent(a:percent)
		execute 'normal! '.movelines.'j'
	endfunction
	function! ScrollUpPercent(percent)
		let movelines=GetScrollPercent(a:percent)
		execute 'normal! '.movelines.'k'
	endfunction
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
