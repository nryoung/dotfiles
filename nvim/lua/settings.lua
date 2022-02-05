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
vim.o.mouse='a'
