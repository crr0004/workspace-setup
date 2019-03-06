$env:HOME = "C:\Users\p784670";
$env:HOMEDRIVE = "C:"
$env:PYTHONHOME = "C:\Users\p784670\dev\Python27";
$env:PYTHONPATH = $env:PYTHONHOME;
$env:AWS_PROFILE="saml_ncg_training"
$env:AWS_CA_BUNDLE="C:\Users\p784670\dev\certs\rootlast.pem"
$env:vscodium = "C:\Users\p784670\dev\vscodium";
$git = "C:\Users\p784670\dev\git"
$env:path += ";C:\Users\p784670\dev\jdk\bin;";

$env:path += $env:vscodium + ";";
$env:path += "C:\Users\p784670\dev\apache-maven-3.6.0\bin;"; 
$env:path += "$git\bin;";
$env:path += "C:\Users\p784670\dev\7zip\;";
$env:path += "C:\Users\p784670\dev\node-v10.15.1-win-x64\;";
$env:path += "C:\Users\p784670\dev\.npm-packages\;";
$env:path += "C:\Users\p784670\dev\ruby-2.6.1-1-x64\bin;";
$env:path += "C:\Users\p784670\dev\Neovim\bin;";
$env:path += "C:\Users\p784670\dev\Vim\vim81;";
$env:path += "C:\Users\p784670\dev\intellij\bin;";
$env:path += $env:PYTHONHOME + ";";
$env:path += $env:PYTHONHOME + "\Scripts;";
$env:no_proxy="artifactory.aus.thenational.com"
$env:JAVA_HOME = "C:\Users\p784670\dev\jdk";
$env:http_proxy = "http://127.0.0.1:3128"
$env:https_proxy = "http://127.0.0.1:3128"
$env:NVIM_PID = -1 

. "$PSScriptRoot\profile_functions.ps1"

Import-Module posh-git

set-alias code vscodium_start
set-alias gitbash git-bash
set-alias ncg_scraper getNabCloudGuildCalendar
set-alias projects goToProjects
set-alias vim startVim
set-alias gvim startVim
cd $env:HOME
