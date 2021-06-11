" ______   __         __  __     ______    
"/\  == \ /\ \       /\ \/\ \   /\  ___\   
"\ \  _-/ \ \ \____  \ \ \_\ \  \ \ \__ \  
" \ \_\    \ \_____\  \ \_____\  \ \_____\ 
"  \/_/     \/_____/   \/_____/   \/_____/ 
"                                          
call plug#begin('~/.vim/plugged')

" === Syntax Highlighting ===
"  Color matching of parentheses and other things
Plug 'luochen1990/rainbow'
" ➕ Show a diff using Vim its sign column.
Plug 'mhinz/vim-signify'

" === UI ===
" Lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
" A colour scheme for terminals, Vim and friends.
Plug 'fenetikm/falcon'

" === Git Plugins ===
Plug 'tpope/vim-fugitive'

" === Language specific plugins ===
" This plugin adds Go language support for Vim
Plug 'fatih/vim-go'
" Vastly improved Javascript indentation and syntax support in Vim
Plug 'pangloss/vim-javascript'
" Distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing
Plug 'elzr/vim-json'
" The React syntax highlighting and indenting plugin for vim
Plug 'maxmellon/vim-jsx-pretty'
" Elixir support for vim
Plug 'elixir-lang/vim-elixir'
" Erlang indentation and syntax for vim
Plug 'vim-erlang/vim-erlang-runtime'
" Elm plugin for Vim
Plug 'elmcast/elm-vim'
" Vim configuration for Rust.
Plug 'rust-lang/rust.vim'
" Vim syntax for TOML
Plug 'cespare/vim-toml'
" CSS3 syntax (and syntax defined in some foreign specifications) support for Vim's built-in syntax/css.vim
Plug 'hail2u/vim-css3-syntax'
" Vim bundle for http://styled-components.com based javascript files.
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" === Functionality ===
" This plug-in provides automatic closing of quotes, parenthesis, brackets, etc.
Plug 'Raimondi/delimitMate'
" Surround.vim is all about surroundings: parentheses, brackets, quotes, XML tags, and more
Plug 'tpope/vim-surround'
" EditorConfig plugin for Vim
Plug 'editorconfig/editorconfig-vim'
" 🌸 A command-line fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" The undo history visualizer for VIM 
Plug 'mbbill/undotree'
" Open a Quickfix item in a window you choose. (Vim plugin) 
Plug 'yssl/QFEnter'
" The missing motion for Vim 👟 
Plug 'justinmk/vim-sneak'
" Ranger integration in vim and neovim 
Plug 'rafaqz/ranger.vim'
" Vim HardTime
Plug 'takac/vim-hardtime'
" Personal Wiki for Vim
Plug 'vimwiki/vimwiki'

" === coc.nvim ===
" Intellisense engine for vim8 & neovim, full language server protocol support as VSCode
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-rust-analyzer', {'do': 'yarn install --frozen-lockfile'}

" === treesitter ===
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-refactor'

call plug#end()
