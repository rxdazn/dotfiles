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

set ignorecase
set smartcase
set showmatch
set hlsearch
set nowrap
set scrolloff=8

set textwidth=80

" line numbers
set number

set cursorcolumn
set cursorline

execute pathogen#infect()

set nocompatible
set laststatus=2
set noshowmode
set encoding=utf-8

"autocmd FileType html setlocal noexpandtab
"autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd FileType html,htmldjango,scss,javascript setlocal noexpandtab
