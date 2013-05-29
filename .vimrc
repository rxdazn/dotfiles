" rxdazn's .vimrc

syntax on
filetype plugin on
filetype indent on
colorscheme distinguished 

set t_Co=256

" tabbing
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
autocmd FileType make setlocal noexpandtab " Makefile

" line numbers
set number
set nuw=2

" search
set hlsearch

" pathogen
call pathogen#infect()
call pathogen#helptags()

" Powerline
set nocompatible    " Disable vi-compatibility
set laststatus=2    " Always show the statusline
set encoding=utf-8  " Necessary to show Unicode glyphs
