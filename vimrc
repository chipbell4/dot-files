" Some basic configs
set number
syntax on
set shiftwidth=3
set tabstop=3
colo koehler
set nowrap

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

" Linting stuff
:function Lint()
:if &ft == 'php'
:    !phpcs --standard=/Users/chip/.composer/vendor/spinen/code_sniffs/src/Spinen/ruleset.xml %
":    !php -l %
:elseif &ft == 'javascript'
:    !jshint %
:elseif &ft == 'python'
:    !pylint %
:endif
:endfunction

" Codecept run single function
:function CodeceptSingle()
:if &ft != 'php'
:	return
:endif
" save our current line
:let linenumber=line('.')
" find the first function
:?function
" parse out the name
:let tokens=split(getline('.'))
:let dirty_function_name=get(tokens, index(tokens, 'function')+1, 'default')
:let function_name_tokens=split(dirty_function_name, '(')
:let function_name=get(function_name_tokens, 0)
:execute '!ant codecept -Dtest=' . expand('%') . ':' . function_name
:endfunction

" Use PSR2 for codesniffer
let g:phpqa_codesniffer_args = "--standard=/Users/chip/.composer/vendor/spinen/code_sniffs/src/Spinen/ruleset.xml"

" PHP code helpers
:nnoremap <leader>l :exe Lint()<CR>
:nnoremap <leader>d :exe PhpDoc()<CR>
:nnoremap <leader>t :exe TestCurrentFile()<CR>
:nnoremap <leader>T :exe AllTests()<CR>
:nnoremap <leader>cf :exe CodeceptSingle()<CR>

" Git commands
:nnoremap <leader>gs :!git status<CR>
:nnoremap <leader>gc :!git commit<CR>
:nnoremap <leader>ga :!git add %<CR>
:nnoremap <leader>gd :!git diff %<CR>

:set expandtab ts=4 sw=4

" Don't run messdetector on save (default = 1)
"let g:phpqa_messdetector_autorun = 0

" Don't run codesniffer on save (default = 1)
"let g:phpqa_codesniffer_autorun = 0
