function listDir
{
	find "$1" -maxdepth 1 -type d -print;
}
function changeDir
{

#DIRS="$(listDir('~/dev/projects/'))"
DIRS="$(listDir ~/dev/source)"

echo $DIRS | awk '
BEGIN{
	RS=" ";
	lineNumber = 1;
}
{
	print NR " " $1;
}'
echo "Choose directory to swap to: "
read dirNumber
echo $DIRS | awk -v dirNumber=$dirNumber '
BEGIN{
	RS=" ";
}
{if (NR==dirNumber) {
	print $1;
}
}'

#echo $DIRS
}
