" NERD Tree
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
map <F3> :NERDTreeToggle<CR>

" Pathogen
call pathogen#infect()

" Misc.
set t_Co=256
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set foldmethod=indent
set foldlevel=99
filetype plugin indent on
syntax on
set backspace=indent,eol,start

" Syntax highlighting for C++ templates
au BufNewFile,BufRead *.tem set filetype=cpp

" Colors
colorscheme wombat

" Vim-flake8
autocmd BufWritePost *.py call Flake8()
