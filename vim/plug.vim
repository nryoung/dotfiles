" ______   __         __  __     ______    
"/\  == \ /\ \       /\ \/\ \   /\  ___\   
"\ \  _-/ \ \ \____  \ \ \_\ \  \ \ \__ \  
" \ \_\    \ \_____\  \ \_____\  \ \_____\ 
"  \/_/     \/_____/   \/_____/   \/_____/ 
"                                          
call plug#begin('~/.vim/plugged')

" === Syntax Highlighting ===
" 🌈 Rainbow parentheses for neovim using tree-sitter 🌈 
Plug 'p00f/nvim-ts-rainbow'
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
" Vim configuration for Rust.
Plug 'rust-lang/rust.vim'

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
" commentary.vim: comment stuff out
Plug 'tpope/vim-commentary'

" === treesitter ===
" Nvim Treesitter configurations and abstraction layer
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Refactor module for nvim-treesitter
Plug 'nvim-treesitter/nvim-treesitter-refactor'
" Neovim treesitter plugin for setting the commentstring based on the cursor location in a file.
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
"  Show code context
Plug 'romgrk/nvim-treesitter-context'

" === telescope ===
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" === LSP ===
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'kabouzeid/nvim-lspinstall'

" === Formatting ===
Plug 'sbdchd/neoformat'
call plug#end()
