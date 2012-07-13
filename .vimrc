filetype plugin on
filetype indent on

colorscheme inkpot 
set         t_Co=256

" tabbing
set autoindent
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab

" max text width
set textwidth=80

" line numbers
set number

" mapping

" pathogen
call pathogen#infect() " default directory is ~/.vim/bundle -> infect(~/src/vim/bundle)

" NERDTree
autocmd vimenter * if !argc() | NERDTree | endif

" Add highlighting for function definition in C++
function! EnhanceCppSyntax()
    syn match cppFuncDef "::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?$"
    hi def link cppFuncDef Special
endfunction

" Function call
autocmd Syntax cpp call EnhanceCppSyntax()

nnoremap t gt
nnoremap T gT
