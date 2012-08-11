" rxdazn's .vimrc

syntax on
filetype plugin on
filetype indent on
colorscheme lucius

set t_Co=256

" tabbing
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
autocmd FileType make setlocal noexpandtab " Makefile

" line numbers
set number
set nuw=2

" tabs
nnoremap t gt
nnoremap T gT

" search
set hlsearch

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Add highlighting for function definition in C++
function! EnhanceCppSyntax()
    syn match cppFuncDef "::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?$"
    hi def link cppFuncDef Special
endfunction

" Function call
autocmd Syntax cpp call EnhanceCppSyntax()

" NERDTree
autocmd vimenter * if !argc() | NERDTree | endif

" pathogen
call pathogen#infect()
call pathogen#helptags()

" Powerline
set nocompatible    " Disable vi-compatibility
set laststatus=2    " Always show the statusline
set encoding=utf-8  " Necessary to show Unicode glyphs
