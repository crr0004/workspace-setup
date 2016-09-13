"autocmd! BufRead * if filereadable('CMakeCache.txt') | call LoadCmakeIncludeDirs() | endif
function! LoadCmakeIncludeDirs(...)
	if !exists("g:LoadCMakeVariable_includeDirs")
		let g:LoadCMakeVariable_includeDirs = 0
	endif
	if(a:0 >= 1)
		let cmakeFile = a:1
		if !filereadable(cmakeFile)
			echo "Couldn't find " . cmakeFile
		endif
	else
		let cmakeFile = fnamemodify('CMakeCache.txt', ':p')
	endif

	if filereadable(cmakeFile) && g:LoadCMakeVariable_includeDirs == 0
		let bufferNumber = bufnr('%')
		execute 'hide view ' . cmakeFile
		let lineNumber = search("HEADER_DIRS_STRING:STRING=", "")
		let headersLine = getline(".")
		let includeDirs = split(substitute(headersLine, "HEADER_DIRS_STRING:STRING=", "", ""), ",")
		let g:LoadCMakeVariable_includeDirs = 1
		let g:syntastic_cpp_include_dirs = get(g:, 'syntastic_cpp_include_dirs','') + includeDirs
		execute 'silent buffer ' . bufferNumber
		execute 'silent bunload! ' . cmakeFile
	endif
endfunction
