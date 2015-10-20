" Some basic configs
set number
syntax on
set shiftwidth=4
set tabstop=4
colo koehler
set nowrap

" Set tabbing to be 2 for JS only
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" Highlight json files as javascript
autocmd BufNewFile,BufRead *.json set ft=javascript

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
set wildignore+=*/node_modules/**

" Use PSR2 for codesniffer
let g:phpqa_codesniffer_args = "--standard=/Users/chip/.composer/vendor/spinen/code_sniffs/src/Spinen/ruleset.xml"

" PHP code helpers
:nnoremap <leader>d :exe PhpDoc()<CR>

" Git commands
:nnoremap <leader>gd :!git diff %<CR>
:nnoremap <leader>gs :!git status<CR>
:nnoremap <leader>gc :!git commit<CR>
:nnoremap <leader>ga :!git add %<CR>
:nnoremap <leader>gd :!git diff %<CR>

:set expandtab

" Don't run messdetector on save (default = 1)
"let g:phpqa_messdetector_autorun = 0

" Don't run codesniffer on save (default = 1)
"let g:phpqa_codesniffer_autorun = 0
set t_Co=256
