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

-- Disable help
vim.api.nvim_set_keymap('i', '<F1>', '<ESC>', { noremap = true })
vim.api.nvim_set_keymap('n', '<F1>', '<ESC>', { noremap = true })
vim.api.nvim_set_keymap('v', '<F1>', '<ESC>', { noremap = true })

-- Remap C-c to Esc
vim.api.nvim_set_keymap('i', '<C-c>', '<ESC>', { noremap = true })

-- Reload vim rc file
vim.api.nvim_set_keymap('n', '<leader>rl', ':so $MYVIMRC<CR>', { noremap = true })

-- Map undotree to ,u
-- nnoremap <leader>u :UndotreeToggle<cr>
vim.api.nvim_set_keymap('n', '<leader>u', ':UndotreeToggle<CR>', { noremap = true })

-- Map various Ranger commands
vim.api.nvim_set_keymap('n', '<leader>r', ':RangerEdit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>rv', ':RangerVSplit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>rs', ':RangerSplit<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>rt', ':RangerTab<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ri', ':RangerInsert<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>ra', ':RangerAppend<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>rc', ':set operatorfunc=RangerChangeOperator<CR>g@', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>rd', ':RangerCD<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>rld', ':RangerLCD<CR>', { noremap = true })

-- Map various Telescope commands
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>Telescope find_files<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>Telescope live_grep<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>Telescope buffers<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>h', '<cmd>Telescope help_tags<CR>', { noremap = true })

-- Map various Compe commands
vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.tab_complete()', {expr = true})
vim.api.nvim_set_keymap('s', '<Tab>', 'v:lua.tab_complete()', {expr = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})
vim.api.nvim_set_keymap('s', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})
