" ______     ______     __   __     ______   __     ______    
"/\  ___\   /\  __ \   /\ "-.\ \   /\  ___\ /\ \   /\  ___\   
"\ \ \____  \ \ \/\ \  \ \ \-.  \  \ \  __\ \ \ \  \ \ \__ \  
" \ \_____\  \ \_____\  \ \_\\"\_\  \ \_\    \ \_\  \ \_____\ 
"  \/_____/   \/_____/   \/_/ \/_/   \/_/     \/_/   \/_____/ 
"                                                             

" === Functionality ===
" Map leader to comma
let mapleader=','
" Automatically reload file when changed outside buffer
set autoread
" Change buffers without saving them
set hidden
" Use the already open buffer if it exists
set switchbuf=useopen,usetab
" Visual bell and no beep
set vb
set noerrorbells
" Disable backup and swap
set noswapfile
set nobackup
set nowritebackup
" Turn on mouse
set mouse=a
if !has('nvim')
    set ttymouse=xterm2
endif
" Disable Ex mode
nnoremap Q <Nop>
" Make Y and D yank until EOL like other capital letters
map Y y$
map D d$
" Enable folding
set foldmethod=indent
set foldlevel=99
" Set bash style word completion
set wildmode=longest:full
set wildmenu
set wildignore=*.swp,*.bak,*.pyc,*.class
" Enable search highlighting
set hlsearch
" Enable incremental search
set incsearch
" Case-insensitive search
set ignorecase
" Match uppercase when searched for
set smartcase
" Do not move the cursor when highlighting
noremap * *N
noremap # #N
" Clear the search highlight with <leader> n
nmap <silent> <leader>n :noh<CR>
" Paste mode toggle
nmap <silent> <leader>p :set paste!<CR>
" Softwrap text
nmap <silent> <leader>w :set wrap! linebreak! textwidth=0<CR>
" Sorting
vmap <leader>s :sort<CR>
" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" Opens a split command with the path of the currently edited file filled in
" Normal mode: <Leader>s
map <Leader>se :split <C-R>=expand("%:p:h") . "/" <CR>
" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>v
map <Leader>ve :vsplit <C-R>=expand("%:p:h") . "/" <CR>
" After shifting a visual block, reselect it to be able to shift again
vnoremap > >gv
vnoremap < <gv
" Automatically reload vimrc on save
autocmd! BufWritePost .vimrc source %
autocmd! BufWritePost .gvimrc source %
" Remember cursor postions on files
autocmd BufReadPost * normal `"
" Disable help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
" Remap C-c to ESC
inoremap <C-c> <ESC>
" Autocomplete on dashed words
set iskeyword+=-
" Share clipboard with system
set clipboard+=unnamed
" Reload .vimrc mapped to something easy
nnoremap <leader>rl :so $MYVIMRC<cr>
" set gf to actually work
set path=.,src,node_modules
set suffixesadd=.js,.jsx

" === Syntax / UI ===
" Syntax highlighting
syntax on
" Turn on indent rules
filetype plugin indent on
set smartindent
" indent per file type
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype elm setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype javascriptreact setlocal ts=2 sts=2 sw=2
autocmd Filetype python setlocal ts=4 sts=4 sw=4
autocmd Filetype rst setlocal ts=2 sts=2 sw=2
autocmd Filetype markdown setlocal ts=2 sts=2 sw=2
autocmd Filetype json setlocal ts=2 sts=2 sw=2
autocmd Filetype scss setlocal ts=2 sts=2 sw=2
" Turn on modelines
set modeline
set modelines=3
" Filetype detection
au BufNewFile,BufRead *.tem set filetype=cpp
au BufNewFile,BufRead *.json set filetype=json
au BufNewFile,BufRead *.tsx set filetype=javascript
" Set terminal width to 80 chars when looking at md or rst files
au BufRead,BufNewFile *.md setlocal wrap linebreak nolist textwidth=80
au BufRead,BufNewFile *.rst setlocal wrap linebreak nolist textwidth=80
" Allow backspacing over all the things in insert mode
set bs=indent,eol,start
" No wrap
set nowrap
" Hide toolbar
set go-=T
" Enable status bar
set laststatus=2
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
" Space between current line and window frame
set scrolloff=4
" 4 spaces, exand tab by default
set sw=4 sts=4 ts=4 expandtab
" See line numbers, ruler, and current line
set number
set ruler
set cursorline
set cursorcolumn
" List special chars such as whitespace and tabs
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅,extends:#
" When splitting window, split to bottom and right
set splitright
set splitbelow
" Resize windows when loading sessions
set sessionoptions+=resize
" Turn on 256 colors if this is xterm or xterm compatible
set t_Co=256
" Don't flicker when executing macros/functions
set lazyredraw
" Color theme
syntax enable
set termguicolors
set background=dark
colorscheme falcon
" Enable hybrid relative line numbers
set relativenumber
set number

" === Airline ===
let g:airline_powerline_fonts=1
let g:falcon_airline = 1
let g:airline_theme = 'falcon'

" === Persistent Undo ===
if has('persistent_undo')
  set undofile
  exec 'set undodir=~/.config/nvim/.undo'
endif
" Map undotree to ,u
nnoremap <leader>u :UndotreeToggle<cr>

" === Vim-Sneak ===
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1

" === Ranger ===
nnoremap <leader>r :RangerEdit<cr>
nnoremap <leader>rv :RangerVSplit<cr>
nnoremap <leader>rs :RangerSplit<cr>
nnoremap <leader>rt :RangerTab<cr>
nnoremap <leader>ri :RangerInsert<cr>
nnoremap <leader>ra :RangerAppend<cr>
nnoremap <leader>rc :set operatorfunc=RangerChangeOperator<cr>g@
nnoremap <leader>rd :RangerCD<cr>
nnoremap <leader>rld :RangerLCD<cr>

" === HardTime ===
let g:hardtime_default_on = 1
let g:hardtime_showmsg = 1
let g:hardtime_maxcount = 10

" === treesitter ===
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,
    disable = { },
  },
  indent = {
    enable = true
  },
  incremental_selection = {
    enable = true
  }
}
EOF
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" === nvim-treesitter-refactor ===
lua <<EOF
require'nvim-treesitter.configs'.setup {
  refactor = {
    highlight_definitions = { enable = true },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<A-*>",
        goto_previous_usage = "<A-#>",
      },
    },
  },
}
EOF

" === nvim-ts-context-commentstring ===
lua <<EOF
require'nvim-treesitter.configs'.setup {
  context_commentstring = {
    enable = true
  }
}
EOF

" === nvim-treesitter-context ===
lua <<EOF
require'treesitter-context.config'.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
}
EOF

" === nvim-ts-rainbow ===
lua <<EOF
require'nvim-treesitter.configs'.setup {
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
  }
}
EOF

" === telescope ===
" Find files using Telescope command-line sugar.
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>


" === LSP ===
lua << EOF
require'lspconfig'.pyright.setup{}
EOF

lua << EOF
-- Compe setup
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF

lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<Cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<Cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<Cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<Cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- local servers = { "pyright" }
-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup { on_attach = on_attach }
-- end

-- lsp install config
-- config that activates keymaps and enables snippet support
local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return {
    -- enable snippet support
    capabilities = capabilities,
    -- map buffer local keybindings when the language server attaches
    on_attach = on_attach,
  }
end
local function setup_servers()
  require'lspinstall'.setup()

  -- get all installed servers
  local servers = require'lspinstall'.installed_servers()

  for _, server in pairs(servers) do
    local config = make_config()
    nvim_lsp[server].setup(config)
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
EOF

" Neoformat and Prettier
if isdirectory($PWD .'/node_modules')
    let $PATH .= ':' . $PWD . '/node_modules/.bin'
endif
autocmd BufWritePre *.js Neoformat
