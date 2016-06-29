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

set laststatus=2

set noshowmode
set encoding=utf-8

"autocmd FileType html setlocal noexpandtab
"autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd FileType html,htmldjango,scss,javascript setlocal noexpandtab

" highlight trailing spaces
match ExtraWhitespace /\s\+$/
highlight ExtraWhitespace ctermbg=red guibg=red
" soft 80 chars limit
let &colorcolumn=join(range(81,999),",")

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'airblade/vim-gitgutter'
" Less CSS Compiler
Plugin 'groenewege/vim-less'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.(git|hg|svn))|(out|bower_components|node_modules|closure-library|third_party)$',
    \ 'file': '\v\.(exe|so|dll|DS_Store)$',
    \ }
let g:syntastic_mode_map = {
    \ 'mode': 'active',
    \ 'passive_filetypes': ['html'],
    \ }
let NERDTreeIgnore = ['\v.DS_Store|.sass-cache|.bundle|.git|.hg|.svn|node_modules|vendor|bower_components$']
