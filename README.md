# workspace-setup
A place for my linux workspace files so I can always clone it into new development enviroments

Good color for warm gray background: #272822

### How To Install
1. `cd scripts`
2. `./install.sh ~/` or `./install.ps1` for windows
3. Provide sudo password as asked



### .bashrc ###
Contains aliases and extensions for bash enviroment. Place in home directory where bashrc can find it
### dirtags ###
Containes a small script to be called from find * -type d -exec dirtags {} where dirtags is the script location
Requires execution and write permissions - u+x from chmod 
### .vim ###
Containes all the custom extensions for the vim enviroment. Place in home directory where vim can find it
####Color Scheme
The colorscheme is set to molokai and can be found at: [tomasr/molokai](http://www.github.com/tomasr/molokai)
### .vimrc ###
Contains all the custom mappings, scripts and other things for vim shell enviroment
### copyme.sh ###
Copies all the viles to their relevant places
### install_plugged.vim ###
Installs the vim plugin managed plugged
###Using print_remote.sh###
This script relies on one parameter being entered as the .git directory of a repo.
Then uses sed to print out the fetch url.
###Using save_repos.sh###
This script uses find to connect to the print_remotes script.
This relies on one parameter being the root directory for find to search, it looks for the .git directories and passes that to print_remotes. This outputs to git_repos.txt
TODO: Seperate out std redirection or make the file be unique for each run
