execute pathogen#infect()
source ~/.vimrcfunc

"fix backspace
set backspace=indent,eol,start

"turn on filetype plugin option
filetype plugin on

"expand tabs for python
autocmd FileType python setlocal et 

"disable jedivim for non-python
let g:jedi#auto_initialization=0
autocmd FileType python call LoadJedi()

"load javacomple for java programs
autocmd FileType java call LoadJavaComplete() 

call LoadAirline()

"set tabwidth to 2
syntax on
set ts=2 sw=2 sts=2 si 

"set terminal color to 256
set t_Co=256

"Make Tab go to next tab and S-Tab go to previous
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprevious<CR>

call FixPageUpDown()
call FixHomeEnd()
