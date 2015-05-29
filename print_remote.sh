#!/bin/bash
cd $1;
cd ../;
remote="$(git remote -v)";
sedScript='s/.+\s(.+)\s\(.+\)/\1/p'
echo $remote | sed -rn $sedScript
