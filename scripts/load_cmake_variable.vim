let cmakeFile = fnamemodify('CMakeCache.txt', ':p')
execute 'hide view ' . cmakeFile
normal! gg
normal! /HEADER_DIRS_STRING
normal n
normal "ay$
echo @a
bdelete!
