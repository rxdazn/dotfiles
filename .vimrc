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
set backspace=indent,eol,start

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

" :vs, :s
set splitright
set diffopt+=vertical

" disable insert line wrap
set formatoptions-=t

" spelling
set spelllang=en
set spellfile=$HOME/.vim/.spell.en.utf-8.add

autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

" Salt .sls
au BufReadPost *.sls set syntax=yaml

set nocompatible              " be iMproved, required
filetype off                  " required

set listchars=eol:¬,tab:→→,trail:~,extends:>,precedes:<
set list

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'

Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'RRethy/vim-illuminate'
" used with universal-ctags
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'milkypostman/vim-togglelist'

Plug 'kien/ctrlp.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-unimpaired'
Plug 'easymotion/vim-easymotion'
Plug 'tommcdo/vim-exchange'
Plug 'haya14busa/incsearch.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'chase/vim-ansible-yaml'

" :CocInstall coc-python

call plug#end()

filetype plugin indent on    " required

" airline
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#show_close_button = 0

" vim remaps

" open tag in new tab
nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T 


" fzf
let g:fzf_layout = { 'down': '~25%' }
nmap <Leader><C-f> :Ag<CR>

" ctrl-p
nnoremap <C-p> :CtrlP<Cr>
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.(git|hg|svn))|(out|bower_components|node_modules|closure-library|third_party)$',
    \ 'file': '\v\.(exe|so|dll|DS_Store)$',
    \ }

" incsearch
nmap / <Plug>(incsearch-forward)
nmap ? <Plug>(incsearch-backward)

" NerdTREE
nmap <Leader>n :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\v.DS_Store|.sass-cache|.bundle|.git|.hg|.svn|node_modules|vendor|bower_components$']

" Tagbar
nmap <Leader>T :TagbarToggle<CR>

" vim-easymotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_upper = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" match letter forward
map <Leader>f <Plug>(easymotion-f)
map <Leader>t <Plug>(easymotion-t)
" match n characters
nmap <Leader>/ <Plug>(easymotion-sn)

" vim-fugitive
nmap <Leader>gd :Gdiffsplit<CR>
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gb :Gblame<CR>
nmap <Leader>gc :Gcommit<CR>

" vim-togglelist
nmap <script> <silent> <leader>l :call ToggleLocationList()<CR>
nmap <script> <silent> <leader>q :call ToggleQuickfixList()<CR>

" coc nvim
if system('uname -s') != "Darwin\n"
    let g:coc_disable_startup_warning = 1
endif
nmap [l <Plug>(coc-diagnostic-prev)
nmap ]l <Plug>(coc-diagnostic-next)
