-- === Airline ===
vim.g.airline_powerline_fonts = 1
vim.g.falcon_airline = 1
vim.g.airline_theme = 'falcon'

-- === Persistent Undo ===
vim.o.undofile = true
vim.o.undodir = vim.fn.expand('~/.config/nvim/.undo')

-- === Vim-Sneak ===
vim.g['sneak#label'] = 1
vim.g['sneak#use_ic_scs'] = 1

-- === HardTime ===
vim.g.hardtime_default_on = 1
vim.g.hardtime_showmsg = 1
vim.g.hardtime_maxcount = 10

-- === treesitter ===
require'nvim-treesitter.configs'.setup {
  ensure_installed = 'all',
  ignore_install = { "phpdoc" },
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

vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'

-- === nvim-treesitter-refactor ===
require'nvim-treesitter.configs'.setup {
  refactor = {
    highlight_definitions = { enable = true },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = 'grr',
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = 'gnd',
        list_definitions = 'gnD',
        list_definitions_toc = 'gO',
        goto_next_usage = '<A-*>',
        goto_previous_usage = '<A-#>',
      },
    },
  },
}

-- === nvim-ts-context-commentstring ===
require'nvim-treesitter.configs'.setup {
  context_commentstring = {
    enable = true
  }
}

-- === nvim-treesitter-context ===
require'treesitter-context'.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
}

-- === nvim-ts-rainbow ===
require'nvim-treesitter.configs'.setup {
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
  }
}

 -- === nvim-cmp ===
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable,
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),

  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
  })
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

--- === LSP ===
local lspconfig = require('lspconfig')

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
  buf_set_keymap('n', '<space>f', '<Cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Enable the following language servers
local servers = {'jsonls', 'html', 'cssls', 'solargraph', 'sumneko_lua', 'rust_analyzer', 'pyright', 'tsserver', 'eslint' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- === nvim-lsp-installer ===
local lsp_installer = require('nvim-lsp-installer')
lsp_installer.on_server_ready(function(server)
    local opts = {
      on_attach = on_attach,
      capabilities = capabilities
    }
    if server.name == 'solargraph' then
      opts.settings = {
        solargraph = {
          diagnostics = true
        }
    }
    end
    if server.name == 'sumneko_lua' then
      opts.settings = {
          Lua = {
              diagnostics = {
                -- Get the language server to recognize the 'vim', 'use' global
                globals = {'vim', 'use'},
              },
              workspace = {
                  -- Make the server aware of Neovim runtime files
                  library = vim.api.nvim_get_runtime_file('', true),
              },
              -- Do not send telemetry data containing a randomized but unique identifier
              telemetry = {
                enable = false,
              },
          },
      }
    end
    server:setup(opts)
end)

-- === Telescope ===
require('telescope').setup{
  pickers = {
    find_files = {
      find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' },
    }
  },
}

-- === Prettier ===
vim.g['prettier#autoformat'] = 1
vim.g['prettier#autoformat_require_pragma'] = 0

-- == Rust ==
vim.g['rustfmt_autosave'] = 1
