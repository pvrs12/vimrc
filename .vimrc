execute pathogen#infect()
source ~/.vimrcfunc

"set tabwidth to 2
syntax on
set ts=2 sw=2 sts=2 si 

"fix backspace
set backspace=indent,eol,start

"set terminal color to 256
set t_Co=256

"Make Tab go to next tab and S-Tab go to previous
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprevious<CR>

call FixPageUpDown()

call LoadAirline()

"turn on filetype plugin option
filetype plugin on

"expand tabs for python
autocmd FileType python setlocal et 

"disable jedivim for non-python
let g:jedi#auto_initialization=0
autocmd FileType python call LoadJedi()

"load javacomple for java programs
autocmd FileType java call LoadJavaComplete() 

autocmd FileType javascript setlocal et ts=4 sw=4 sts=4
