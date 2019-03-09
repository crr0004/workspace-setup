function checkAndCreate($dir){
    if(!(Test-Path $dir)){
        New-Item -ItemType Directory -Path $dir
    }
}

function Expand-ZIPFile($file, $destination)
{
$shell = new-object -com shell.application
$zip = $shell.NameSpace($file)
foreach($item in $zip.items())
{
$shell.Namespace($destination).copyhere($item)
}
}

$vimHome = "$env:homedrive$env:homepath\vimfiles"
$filesDir = (Split-Path -Parent -Path $MyInvocation.MyCommand.Definition) + "\..\files\"
checkAndCreate($vimHome)
checkAndCreate("$vimHome\autoload")
checkAndCreate("$vimHome\colors")
checkAndCreate(".\temp")
checkAndCreate("$HOME\dev\")
checkAndCreate("$HOME\dev\vim\")
checkAndCreate("$HOME\dev\ctags")

Copy-Item -Path $filesDir\vimrc -Destination $vimHome
Copy-Item -Path $filesDir\gitignore -Destination $HOME
git config --global core.excludesfile '~/gitignore'
start-bitstransfer -destination "$vimHome\autoload\plug.vim" -source https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
start-bitstransfer -destination "$vimHome\colors\molokai.vim" -source https://raw.githubusercontent.com/crr0004/molokai/master/colors/molokai.vim
Invoke-WebRequest -OutFile ".\temp\ctags-6f8535e-x64.zip" -Uri https://github.com/crr0004/ctags/releases/download/0.1/ctags-6f8535e-x64.zip -Method Get
Invoke-WebRequest -OutFile ".\temp\vim74999.zip" -Uri https://github.com/crr0004/vim/releases/download/v7.4.999/vim74.zip -Method Get
Invoke-WebRequest -OutFile ".\temp\7z1602.exe" -Uri http://www.7-zip.org/a/7z1602.exe -Method Get

#del -Recurse ".\temp\"