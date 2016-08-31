function! LoadCmakeIncludeDirs()
	let cmakeFile = fnamemodify('CMakeCache.txt', ':p')
	if filereadable(cmakeFile)
		execute 'hide view ' . cmakeFile
		normal! gg
		normal! /HEADER_DIRS_STRING:STRING=
		normal! n
		normal! "ay$
		let includeDirs = split(substitute(@a, "HEADER_DIRS_STRING:STRING=", "", ""), ",")
		let g:syntastic_cpp_include_dirs = get(g:, 'syntastic_cpp_include_dirs','') + includeDirs
		silent bdelete!
	endif
endfunction
