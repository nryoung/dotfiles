local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  -- === Syntax / UI ===
  -- 🌆 A clean, dark Neovim theme written in Lua, with support for lsp, treesitter and lots of plugins.
  'folke/tokyonight.nvim',
  -- lua `fork` of vim-web-devicons for neovim
  'nvim-tree/nvim-web-devicons',
  -- A blazing fast and easy to configure neovim statusline plugin written in pure lua.
  'nvim-lualine/lualine.nvim',
  -- Git integration for buffers
  'lewis6991/gitsigns.nvim',
  -- Indent guides for Neovim
  'lukas-reineke/indent-blankline.nvim',
  -- a lua powered greeter like vim-startify / dashboard-nvim
  {
      'goolord/alpha-nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function ()
          require'alpha'.setup(require'alpha.themes.startify'.config)
      end
  },
  -- 🚦 A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
  { 'folke/trouble.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' }, },
  -- Rainbow delimiters for Neovim with Tree-sitter
  'hiphish/rainbow-delimiters.nvim',

  -- === Functionality ===
  -- 🦘 Neovim's answer to the mouse
  'ggandor/leap.nvim',
  -- 🧠 💪 // Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more
  'numToStr/Comment.nvim',
  -- The undo history visualizer for VIM
  'mbbill/undotree',
  -- Ranger integration in vim and neovim
  'rafaqz/ranger.vim',
  -- A Neovim plugin helping you establish good command workflow and habit 
  {
   "m4xshen/hardtime.nvim",
   dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
   opts = { max_count = 8 }
  },
  -- fugitive.vim: A Git wrapper so awesome, it should be illegal
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  -- Surround.vim is all about surroundings: parentheses, brackets, quotes, XML tags, and more
  'tpope/vim-surround',
  -- sleuth.vim: Heuristically set buffer options
  'tpope/vim-sleuth',
  -- This plug-in provides automatic closing of quotes, parenthesis, brackets, etc.
  'Raimondi/delimitMate',
  -- EditorConfig plugin for Vim
  'editorconfig/editorconfig-vim',
  -- Open a Quickfix item in a window you choose. (Vim plugin)
  'yssl/QFEnter',

  -- === Telescope ===
  -- Find, Filter, Preview, Pick. All lua, all the time.
  { 'nvim-telescope/telescope.nvim', tag = '0.1.3', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },

  -- == Tresitter ==
  -- Highlight, edit, and navigate code
  { 'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },
  -- Additional text objects via treesitter
  { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter', },

  -- == Autocompletion ==
  -- Autocompletion
  { 'hrsh7th/nvim-cmp', dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' }, },

  -- === LSP ===
  -- LSP Configuration & Plugins
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  },

  -- === Language specific plugins ===
  -- This plugin adds Go language support for Vim
  'fatih/vim-go',
  -- Vim configuration for Rust.
  'rust-lang/rust.vim',
  -- Vim config for Prettier
  {
    'prettier/vim-prettier',
    run = 'yarn install --frozen-lockfile --production',
    ft = {'javascript', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'graphql', 'vue', 'html'},
  }
})
