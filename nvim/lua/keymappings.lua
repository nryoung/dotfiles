-- Map leader to comma
vim.g.mapleader = ','

-- Disable Ex mode
vim.api.nvim_set_keymap('n', 'Q', '<Nop>', { noremap = true })

-- Make Y and D yank until EOL like other capital letters
vim.api.nvim_set_keymap('', 'Y', 'y$', {})
vim.api.nvim_set_keymap('', 'D', 'd$', {})

-- Do not move the cursoer when highlighting
vim.api.nvim_set_keymap('n', '*', '*N', { noremap = true })
vim.api.nvim_set_keymap('n', '#', '#N', { noremap = true })

-- Clear the search highlight with <leader> n
vim.api.nvim_set_keymap('n', '<leader>n', ':noh<CR>', { noremap = false })

-- Paste mode toggle
vim.api.nvim_set_keymap('n', '<silent> <leader>p', ':set paste!', { noremap = false })

-- Softwrap text
vim.api.nvim_set_keymap('n', '<silent> <leader>w', ':set wrap! linebreak! textwidth=0<CR>', { noremap = false })

-- Sorting in visual mode
vim.api.nvim_set_keymap('v', '<leader>s', ':sort<CR>', {})

-- Opens an edit command with the path of the currently edited file filled in
-- Normal mode: <leader>e
vim.api.nvim_set_keymap('', '<leader>e', ':e <C-R>=expand("%:p:h") . "/" <CR>', {})

-- Opens a split command with the path of the currently edited file filled in
-- Normal mode: <leader>se
vim.api.nvim_set_keymap('', '<leader>se', ':split <C-R>=expand("%:p:h") . "/" <CR>', {})

-- Opens a tab edit command with the path of the currently edited file filled in
-- Normal mode: <leader>ve
vim.api.nvim_set_keymap('', '<leader>ve', ':vsplit <C-R>=expand("%:p:h") . "/" <CR>', {})

-- After shifting a visual block, reselect it to be able to shift again
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true })
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true })
