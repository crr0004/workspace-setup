$vimHome = "$env:homedrive$env:homepath\.vim\"
New-item $vimHome -type directory
new-item $vimHome\autoload -type directory
new-item $vimHome\colors -type directory
start-bitstransfer -destination "$env:homedrive$env:homepath\.vim\autoload\plug.vim" -source https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
start-bitstransfer -destination "$vimHome/colors/molokai.vim" -source https://raw.githubusercontent.com/crr0004/molokai/master/colors/molokai.vim
