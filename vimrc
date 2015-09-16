set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set autoindent
augroup python_files
	autocmd!
	autocmd FileType python setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
augroup END
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 noexpandtab autoindent
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2 noexpandtab autoindent
