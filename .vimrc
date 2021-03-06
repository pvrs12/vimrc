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
"let g:jedi#auto_initialization=0
"autocmd FileType python call LoadJedi()

"load javacomple for java programs
"autocmd FileType java call LoadJavaComplete() 

"Automatically create headerguard for c/c++ headerfiles
autocmd BufNewFile *.{h,hpp,hxx,ipp} call AutoHeaderGuard()

autocmd FileType javascript setlocal et ts=4 sw=4 sts=4

"A function to count how many characters are currently in the visual buffer
call CountSelectionChars()

"Use {{ { and } }} to fold/unfold code
set foldmethod=marker

hi Folded         ctermbg=238
hi FoldColumn     ctermbg=238

hi CSVColumnEven  ctermbg=4
hi CSVColumnOdd   ctermbg=5

"Persistent Undo file
if !exists(':tnoremap')
	if !isdirectory("/tmp/.vim-undo-dir")
		call mkdir("/tmp/.vim-undo-dir", "", 0700)
	endif
	set undodir=/tmp/.vim-undo-dir
endif
set undofile
