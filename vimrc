" Some basic configs
set number
syntax on
set shiftwidth=3
set tabstop=3
colo koehler

let mapleader = ","

" Some custom commands that helps out
command Q execute "qall"
command W execute "wall"
command WQ execute "wall" | execute "qall"

" Enable Pathogen
execute pathogen#infect()
filetype plugin indent on

" Powerline configs
set laststatus=2

" NERDTree Configs
" autocmd VimEnter * NERDTree " Always open NERDTree
" autocmd VimEnter * wincmd p " Put cursor in file, not dir tree

" Cntrl-P Configs
" When I type <cntrl-P> to open a file, ignore these folders in the search
set wildignore+=*/vendor/**
set wildignore+=*/build/**

" Linting stuff
:function Lint()
:if &ft == 'php'
":!phpcs --tab-width=0 %
:!php -l %
:elseif &ft == 'javascript'
:!jshint %
:endif
:endfunction

:nnoremap <leader>l :call Lint()<CR>
