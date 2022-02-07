-- bootstrap packer if not installed already
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- Plugins here

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- === Syntax / UI ===
  -- A colour scheme for terminals, Vim and friends.
  use 'fenetikm/falcon'
  -- Lean & mean status/tabline for vim that's light as air
  use 'vim-airline/vim-airline'
  -- Nvim Treesitter configurations and abstraction layer
  use {
    'nvim-treesitter/nvim-treesitter',
     run = ':TSUpdate'
  }
  -- 🌈 Rainbow parentheses for neovim using tree-sitter 🌈 
  use 'p00f/nvim-ts-rainbow'
  -- ➕ Show a diff using Vim its sign column.
  use 'mhinz/vim-signify'

  -- === Functionality ===
  -- The undo history visualizer for VIM
  use 'mbbill/undotree'
  -- The missing motion for Vim 👟
  use 'justinmk/vim-sneak'
  -- Ranger integration in vim and neovim 
  use 'rafaqz/ranger.vim'
  -- Vim HardTime
  use 'takac/vim-hardtime'
  -- Refactor module for nvim-treesitter
  use 'nvim-treesitter/nvim-treesitter-refactor'
  -- Neovim treesitter plugin for setting the commentstring based on the cursor location in a file.
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  -- commentary.vim: comment stuff out
  use 'tpope/vim-commentary'
  -- Show code context
  use 'romgrk/nvim-treesitter-context'
  -- fugitive.vim: A Git wrapper so awesome, it should be illegal
  use 'tpope/vim-fugitive'
  -- This plug-in provides automatic closing of quotes, parenthesis, brackets, etc.
  use 'Raimondi/delimitMate'
  -- Surround.vim is all about surroundings: parentheses, brackets, quotes, XML tags, and more
  use 'tpope/vim-surround'
  -- EditorConfig plugin for Vim
  use 'editorconfig/editorconfig-vim'
  -- Open a Quickfix item in a window you choose. (Vim plugin) 
  use 'yssl/QFEnter'
  -- Personal Wiki for Vim
  use 'vimwiki/vimwiki'

  -- === Language specific plugins ===
  -- This plugin adds Go language support for Vim
  use 'fatih/vim-go'
  -- Vim configuration for Rust.
  use 'rust-lang/rust.vim'

  -- === telescope ===
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  -- === LSP ===
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use 'williamboman/nvim-lsp-installer'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
