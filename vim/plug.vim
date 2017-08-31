" ______   __         __  __     ______    
"/\  == \ /\ \       /\ \/\ \   /\  ___\   
"\ \  _-/ \ \ \____  \ \ \_\ \  \ \ \__ \  
" \ \_\    \ \_____\  \ \_____\  \ \_____\ 
"  \/_/     \/_____/   \/_____/   \/_____/ 
"                                          
call plug#begin('~/.vim/plugged')

Plug 'Raimondi/delimitMate'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'luochen1990/rainbow'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-surround'
Plug 'kchmck/vim-coffee-script'
Plug 'mustache/vim-mustache-handlebars'
Plug 'elixir-lang/vim-elixir'
Plug 'editorconfig/editorconfig-vim'
Plug 'neomake/neomake'
Plug 'mhinz/vim-grepper'
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'mtth/scratch.vim'
Plug 'sbdchd/neoformat'
Plug 'elmcast/elm-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'w0rp/ale'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'fleischie/vim-styled-components'
Plug 'hail2u/vim-css3-syntax'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

call plug#end()
