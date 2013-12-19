filetype plugin on
filetype indent on
syntax on

colorscheme jellybeans 
set         t_Co=256

" tabbing
set autoindent
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab
set hlsearch

" max text width
set textwidth=80

" line numbers
set number

execute pathogen#infect()

set nocompatible
set laststatus=2
set noshowmode
set encoding=utf-8

"autocmd FileType html setlocal noexpandtab
autocmd FileType html,htmldjango,javascript,scss setlocal noexpandtab
