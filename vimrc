" NERD_tree config
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=1
map <F3> :NERDTreeToggle<CR>

call pathogen#infect()
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
au BufNewFile,BufRead *.tem set filetype=cpp
colorscheme wombat
