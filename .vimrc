syntax on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set noexpandtab
set smartindent
augroup python_files
	autocmd!
	autocmd FileType python setlocal expandtab 
augroup END

execute pathogen#infect()
