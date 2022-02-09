-- Turn syntax highlighting on
vim.o.syntax = 'on'

-- Turn on indent rules
vim.cmd('filetype plugin indent on')
vim.o.smartindent = true

-- Set indent per file type
vim.cmd('autocmd Filetype html setlocal ts=2 sts=2 sw=2')
vim.cmd('autocmd Filetype ruby setlocal ts=2 sts=2 sw=2')
vim.cmd('autocmd Filetype elm setlocal ts=2 sts=2 sw=2')
vim.cmd('autocmd Filetype javascript setlocal ts=2 sts=2 sw=2')
vim.cmd('autocmd Filetype javascriptreact setlocal ts=2 sts=2 sw=2')
vim.cmd('autocmd Filetype python setlocal ts=4 sts=4 sw=4')
vim.cmd('autocmd Filetype rst setlocal ts=2 sts=2 sw=2')
vim.cmd('autocmd Filetype markdown setlocal ts=2 sts=2 sw=2')
vim.cmd('autocmd Filetype json setlocal ts=2 sts=2 sw=2')
vim.cmd('autocmd Filetype scss setlocal ts=2 sts=2 sw=2')
vim.cmd('autocmd Filetype lua setlocal ts=2 sts=2 sw=2')
vim.cmd('autocmd Filetype rust setlocal ts=4 sts=4 sw=4')

-- Turn on modelines
vim.o.modeline = true
vim.o.modelines = 3

-- Filetype detection for misc files
vim.cmd('au BufNewFile,BufRead *.tem set filetype=cpp')
vim.cmd('au BufNewFile,BufRead *.json set filetype=json')
vim.cmd('au BufNewFile,BufRead *.tsx set filetype=javascript')
vim.cmd('au BufNewFile,BufRead *.jsx set filetype=javascript')

-- Set terminal width to 80 chars when viewing/editing md files
vim.cmd([[
augroup Markdown
  autocmd!
  autocmd FileType markdown set wrap linebreak nolist textwidth=80
augroup END
]])
-- Set terminal width to 80 chars when viewing/editing wiki files
vim.cmd([[
augroup Vimwiki
  autocmd!
  autocmd FileType vimwiki set wrap linebreak nolist textwidth=80
augroup END
]])

-- Space between current line and window frame
vim.o.scrolloff = 4

-- 2 spaces, expandtab by default
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2

-- See line numbers, ruler, current line, relative line numbers
vim.o.number = true
vim.o.ruler = true
vim.o.cursorline = true
vim.o.cursorcolumn = true
vim.o.relativenumber = true

-- List special chars such as whitespace and tabs
vim.o.list = true
vim.cmd([[set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅,extends:#]])

-- Don't flicker when executing macros/functions
vim.o.lazyredraw = true

-- Enable termguicolors and background
vim.o.termguicolors = true
vim.o.background = 'dark'

-- Set colorscheme
vim.cmd([[colorscheme falcon]])
