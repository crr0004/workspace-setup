#!/bin/bash
 
#Finds the index of the extension
index="$(expr match "$1" '.*\.')"
#Gets the file's name without the extension
name=${1:0:index-1}
 
#Gets the file's respective directory
filedir="$(expr match "$name" '.*\/')"
#Creates the file respective directory
mkdir -p "$2${name:1:filedir-1}"
#Name to save as
nameout=${name:1}
#Finally convert the file
ffmpeg -i "$1" -codec:a libmp3lame -q:a 4 -n:v "$2$nameout@160k.mp3"
 
#Had cover photos and some other documents in the respective folders
#Sample find: find . -iregex '\(.*sh~?\|.*jp.?g\|.*part\|.*png\|.*pdf\|\.\/compressed\)' -prune -o -type f -exec ./convert.sh {} ./compressed \;

#In parallel
#find . -iregex \(.*sh~?\|.*jp.?g\|.*part\|.*png\|.*pdf\|\.\/compressed\) -prune -o -type f | parallel -i -j4 -- /home/chris/dev/scripts/compress_audio.sh {} ../converted\ audio/

