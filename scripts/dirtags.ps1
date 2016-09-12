function BuildCtags(){
$root = pwd; 
Get-ChildItem -name -Recurse -Directory | where {$_ -inotlike "*build*"} | %{
set-location -path $_;
ctags -f .tags *;
set-location $root
};
ctags --file-scope=no -R -f .tags
}
