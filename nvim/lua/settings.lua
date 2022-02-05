-- Set autoread to true
-- XXX: update this to actually reload the buffer on focus gained
vim.o.autoread = true

-- Change buffers without saving them
vim.o.hidden = true

-- Use the already open buffer if it exists
vim.o.switchbuf = 'useopen,usetab'

-- Visual bell and no beep
vim.o.vb = true
vim.o.eb = false

-- Disable backup and swap
vim.o.swapfile = false
vim.o.backup = false
vim.o.writebackup = false

-- Turn on mouse
vim.o.mouse = 'a'

-- Enable folding
vim.o.foldmethod = 'indent'
vim.o.foldlevel=99

-- Set bash style word completion
vim.o.wildmode = 'longest:full'
vim.o.wildmenu = true
vim.o.wildignore = '*.swp,*.bak,*.pyc,*.class'

-- Enable search highlighting
vim.o.hlsearch = true

-- Enable incremental search
vim.o.incsearch = true

-- Case-insensitive search
vim.o.ignorecase = true

-- Match uppercase when searched for
vim.o.smartcase = true

-- Remember cursor positions in files
vim.api.nvim_command('autocmd BufReadPost * normal `"')
