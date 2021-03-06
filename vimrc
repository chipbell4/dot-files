" Some basic configs
set number
syntax on
set shiftwidth=4
set tabstop=4
colo koehler
set nowrap
set expandtab

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

" Git commands
:nnoremap <leader>gd :!git diff %<CR>
:nnoremap <leader>gs :!git status<CR>
:nnoremap <leader>gc :!git commit<CR>
:nnoremap <leader>ga :!git add %<CR>
:nnoremap <leader>gd :!git diff %<CR>
:nnoremap <leader>nt :!npm test<CR>

" Configs to make tmux happy
set t_Co=256
