#!/bin/bash
find $1 -name .git -exec ./print_remote.sh {} \; > git_repos.txt
