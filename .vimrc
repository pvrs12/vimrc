execute pathogen#infect()
source ~/.vimrcfunc

"set tabwidth to 2
syntax on
set ts=2 sw=2 sts=2 si 
set matchpairs+=<:>

"fix backspace
set backspace=indent,eol,start

"set terminal color to 256
set t_Co=256

"automatically change directories
set autochdir

"set the search highlight color to something useful
hi Search ctermbg=25

"Make Tab go to next tab and S-Tab go to previous
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprevious<CR>

"Make c-a leave the terminal focus
if exists(':tnoremap')
	tnoremap <c-a> <c-\><c-n>
endif

call FixPageUpDown()

call LoadAirline()

"remember lvimrc loading optinos
let g:localvimrc_persistent=2

"turn on filetype plugin option
filetype plugin on

"expand tabs for python
autocmd FileType python setlocal et 

"disable jedivim for non-python
let g:jedi#auto_initialization=0
autocmd FileType python call LoadJedi()

"load javacomple for java programs
autocmd FileType java call LoadJavaComplete() 

"Automatically create headerguard for c/c++ headerfiles
autocmd BufNewFile *.{h,hpp,hxx,ipp} call AutoHeaderGuard()

autocmd FileType javascript setlocal et ts=4 sw=4 sts=4

"A function to count how many characters are currently in the visual buffer
call CountSelectionChars()

"Custom folding based on comments in the code
let g:fold_depth=0
function! FoldExpression(lnum)
	if getline(a:lnum - 1) =~ '^.*vim:startfold'
		let g:fold_depth=g:fold_depth + 1
		return '>'.g:fold_depth
	elseif getline(a:lnum + 1) =~ '.*vim:endfold'
		let g:fold_depth=g:fold_depth - 1
		return '<'.g:fold_depth
	else
		return '='
	endif
endfunction

set foldmethod=expr
set foldexpr=FoldExpression(v:lnum)

hi Folded         ctermbg=238
hi FoldColumn     ctermbg=238

