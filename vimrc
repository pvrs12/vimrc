syntax on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set noexpandtab
set autoindent
augroup python_files
	autocmd!
	autocmd FileType python setlocal expandtab tabstop=2 softtabstop=2 shiftwidth=2
augroup END
autocmd FileType javascript,json setlocal tabstop=2 shiftwidth=2 softtabstop=2 noexpandtab autoindent
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2 noexpandtab autoindent
