function vscodium_start {
$env:VSCODE_DEV="";
$env:ELECTRON_RUN_AS_NODE=1;
Start-Process VSCodium.exe -ArgumentList $($env:vscodium + "\resources\app\out\cli.js");
}

function getNabCloudGuildCalendar(){

push-location -path $env:HOME\dev\projects\nabcloudguild\scaper\; 
npm start $args;
pop-location;
}

function git-bash {
Start-Process "$git\git-bash.exe";
}

function goToProjects{
push-location -path $env:HOME\dev\projects
}

function startVim{
	$nvimRunning = Get-Process gvim
		if(-not $nvimRunning){
			start-process gvim.exe -ArgumentList "--servername vim ";
		}
	start-process vim.exe -WindowStyle Hidden -ArgumentList "--servername vim --remote-tab $args";
}

function stopVim{
$nvim = get-process gvim;
Stop-Process $gvim;
}
