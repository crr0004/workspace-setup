"autocmd! BufRead * if filereadable('CMakeCache.txt') | call LoadCmakeIncludeDirs() | endif
function! LoadCmakeIncludeDirs()
	let cmakeFile = fnamemodify('CMakeCache.txt', ':p')
	if filereadable(cmakeFile) 
		let bufferNumber = bufnr('%')
		hide view
		execute 'view ' . cmakeFile
		echo bufferNumber
		let lineNumber = search("HEADER_DIRS_STRING:STRING=", "")
		let headersLine = getline(".")
		let includeDirs = split(substitute(headersLine, "HEADER_DIRS_STRING:STRING=", "", ""), ",")
		let g:LoadedCMake = 1
		echo includeDirs
		let g:syntastic_cpp_include_dirs = get(g:, 'syntastic_cpp_include_dirs','') + includeDirs
"		execute 'silent bunload! CMakeCache'
	endif
endfunction
