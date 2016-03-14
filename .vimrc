syntax on

execute pathogen#infect()

"set tabwidth to 2
set ts=2 sw=2 sts=2 si 

"expand tabs for python
autocmd FileType python setlocal et 

"fix pageup and down so that the cursor stays in place
map <PageDown> :set scroll=0<CR>:set scroll^=2<CR>:set scroll-=1<CR><C-D>:set scroll=0<CR>
map <PageUp> :set scroll=0<CR>:set scroll^=2<CR>:set scroll-=1<CR><C-U>:set scroll=0<CR>

"do the same for visual mode
nnoremap <silent> <PageUp> <C-U><C-U>
vnoremap <silent> <PageUp> <C-U><C-U>
inoremap <silent> <PageUp> <C-\><C-O><C-U><C-\><C-O><C-U>

nnoremap <silent> <PageDown> <C-D><C-D>
vnoremap <silent> <PageDown> <C-D><C-D>
inoremap <silent> <PageDown> <C-\><C-O><C-D><C-\><C-O><C-D>

"Make C-Tab go to next tab and C-S-Tab go to previous
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprevious<CR>

"set terminal color to 256
set t_Co=256

"set statusbar on
set laststatus=2
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts=1

"jedi stuff (fixes issue with tabs being wrongly sized)
let g:jedi#show_call_signatures=0
let g:jedi#auto_vim_configuration = 0

if !jedi#init_python()
    finish
endif

if g:jedi#auto_initialization
    if g:jedi#completions_enabled
        " We need our own omnifunc, so this overrides the omnifunc set by
        " $VIMRUNTIME/ftplugin/python.vim.
        setlocal omnifunc=jedi#completions

        " map ctrl+space for autocompletion
        if g:jedi#completions_command == "<C-Space>"
            " In terminals, <C-Space> sometimes equals <Nul>.
            imap <buffer> <Nul> <C-Space>
            smap <buffer> <Nul> <C-Space>
        endif
        if g:jedi#completions_command != ""
            execute "inoremap <expr> <buffer> ".g:jedi#completions_command." jedi#complete_string(0)"
            " A separate mapping for select mode: deletes and completes.
            execute "snoremap <expr> <buffer> ".g:jedi#completions_command." '\<C-g>c'.jedi#complete_string(0)"
        endif
    endif
endif
