-- bootstrap packer if not installed already
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  -- Plugins here

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- === Syntax / UI ===
  use 'navarasu/onedark.nvim'
  -- A colour scheme for terminals, Vim and friends.
  -- use 'fenetikm/falcon'
  -- lua `fork` of vim-web-devicons for neovim
  use 'nvim-tree/nvim-web-devicons'
  -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
  use { 'nvim-lualine/lualine.nvim', commit = '5f68f07' }
  -- 🌈 Rainbow parentheses for neovim using tree-sitter 🌈
  use 'mrjones2014/nvim-ts-rainbow'
  -- Git integration for buffers
  use 'lewis6991/gitsigns.nvim'
  -- Indent guides for Neovim
  use "lukas-reineke/indent-blankline.nvim"
  -- a lua powered greeter like vim-startify / dashboard-nvim
  use {
      'goolord/alpha-nvim',
      requires = { 'nvim-tree/nvim-web-devicons' },
      config = function ()
          require'alpha'.setup(require'alpha.themes.startify'.config)
      end
  }


  -- === LSP ===
  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  }

  -- == Autocompletion ==
  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }

  -- -- == Tresitter ==
  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  -- === Functionality ===
  -- The undo history visualizer for VIM
  use 'mbbill/undotree'
  -- The missing motion for Vim 👟
  use 'justinmk/vim-sneak'
  -- Ranger integration in vim and neovim
  use 'rafaqz/ranger.vim'
  -- Vim HardTime
  use 'takac/vim-hardtime'
  -- fugitive.vim: A Git wrapper so awesome, it should be illegal
  use 'tpope/vim-fugitive'
  -- rhubarb.vim: GitHub extension for fugitive.vim
  use 'tpope/vim-rhubarb'
  -- This plug-in provides automatic closing of quotes, parenthesis, brackets, etc.
  use 'Raimondi/delimitMate'
  -- Surround.vim is all about surroundings: parentheses, brackets, quotes, XML tags, and more
  use 'tpope/vim-surround'
  -- EditorConfig plugin for Vim
  use 'editorconfig/editorconfig-vim'
  -- Open a Quickfix item in a window you choose. (Vim plugin)
  use 'yssl/QFEnter'
  -- sleuth.vim: Heuristically set buffer options
  use 'tpope/vim-sleuth'
  -- 🧠 💪 // Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more
  use 'numToStr/Comment.nvim'

  -- === Language specific plugins ===
  -- This plugin adds Go language support for Vim
  use 'fatih/vim-go'
  -- Vim configuration for Rust.
  use 'rust-lang/rust.vim'
  -- Vim config for Prettier
  use {
    'prettier/vim-prettier',
    run = 'yarn install --frozen-lockfile --production',
    ft = {'javascript', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'graphql', 'vue', 'html'},
  }

  -- === telescope ===
    -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  if is_bootstrap then
    require('packer').sync()
  end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end
