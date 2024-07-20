-- Neodev setup
require('neodev').setup({})

local lspsaga = require('lspsaga')
lspsaga.setup({
  ui = {
    border = "rounded",
  }
})

local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
  local bind = vim.keymap.set
  bind('n', 'gd', '<cmd>Lspsaga goto_definition<cr>',
    { desc = 'LSP: Go to definition', noremap = true, silent = true, buffer = true })
  bind('n', 'gD', vim.lsp.buf.declaration, { desc = 'LSP: Go to Declaration', noremap = true, silent = true, buffer = true })
  bind('n', 'gh', '<cmd>Lspsaga lsp_finder<cr>', { desc = 'LSP: Go Hunt', noremap = true, silent = true, buffer = true })
  bind('n', 'K', '<cmd>Lspsaga hover_doc<cr>', { desc = 'LSP: Hover', noremap = true, silent = true, buffer = true })
  bind('n', 'gp', '<cmd>Lspsaga peek_definition<cr>',
    { desc = 'LSP: Go Peek Definition', noremap = true, silent = true, buffer = true })
  bind('n', '<leader>K', '<cmd>Lspsaga hover_doc ++keep<cr>',
    { desc = 'LSP: Hover (Keep)', noremap = true, silent = true, buffer = true })
  bind('n', 'gs', vim.lsp.buf.signature_help, { desc = 'LSP: Signature Help', noremap = true, silent = true, buffer = true })
  bind('n', 'gi', vim.lsp.buf.implementation,
    { desc = 'LSP: Go to Implementation', noremap = true, silent = true, buffer = true })
  bind('n', '<leader>ca', '<cmd>Lspsaga code_action<cr>',
    { desc = 'LSP: Code Action', noremap = true, silent = true, buffer = true })
  bind('n', '<leader>co', '<cmd>Lspsaga outline<cr>',
    { desc = 'LSP: Code Outline', noremap = true, silent = true, buffer = true })
  bind('n', '<leader>cb', '<cmd>Lspsaga show_buf_diagnostics<cr>',
    { desc = 'LSP: Show Buffer Diagnostics', noremap = true, silent = true, buffer = true })
  bind('n', 'gl', '<cmd>Lspsaga show_line_diagnostics<cr>',
    { desc = 'LSP: Show Line Diagnostics', noremap = true, silent = true, buffer = true })
  bind('n', 'gr', vim.lsp.buf.references, { desc = 'LSP: Show References', noremap = true, silent = true, buffer = true })
  bind('n', '[d', function() vim.diagnostic.goto_prev({ float = { border = "single" } }) end,
    { desc = 'Diagnostics: Previous', noremap = true, silent = true, buffer = true })
  bind('n', ']d', function() vim.diagnostic.goto_next({ float = { border = "single" } }) end,
    { desc = 'Diagnostics: Next', noremap = true, silent = true, buffer = true })
  bind('n', '<leader>q', vim.diagnostic.setloclist,
    { desc = 'Diagnostics: Show location list', noremap = true, silent = true, buffer = true })
  bind('n', '<leader>cf', function() vim.lsp.buf.format { async = true } end,
    { desc = 'LSP: Format File', noremap = true, silent = true, buffer = true })
end)

-- set sign icons
lsp.set_sign_icons({
  error = ' ',
  warn = ' ',
  hint = ' ',
  info = ' '
})

-- IMPORTANT: list servers installed in your system
lsp.setup_servers({
  'bashls',
  'hls',
  'julials',
  'lua_ls',
  'marksman',
  'nil_ls',
  'pyright',
  'r_language_server',
  'ruff_lsp',
  'rust_analyzer',
  'texlab',
  -- 'rnix',
})

-- (Optional) Configure lua language server for neovim and any other servers
local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

lspconfig.ruff_lsp.setup({
  on_init = function(client)
    client.server_capabilities.hoverProvider = false
  end,
})

lspconfig.nil_ls.setup({
  settings = {
    ['nil'] = {
      formatting = {
        command = { "nixpkgs-fmt" },
      }
    }
  }
})

lspconfig.rust_analyzer.setup {}

lspconfig.r_language_server.setup{}

lsp.setup()

-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
local luasnip = require("luasnip")
local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }
local lspkind = require('lspkind')

luasnip.config.set_config({
  history = true,
  --region_check_events = 'InsertEnter'
  delete_check_events = 'InsertLeave',
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
  ext_opts = {
    [require("luasnip.util.types").choiceNode] = {
      active = {
        virt_text = { { " ", "Error" }, }
      },
    },
  },
  -- store_selection_keys = '<c-s>'
})

require('luasnip.loaders.from_vscode').lazy_load()
-- load custom snippets
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })


cmp.setup({
  preselect = 'none',
  completion = {
    completeopt = 'menu,menuone,noinsert,noselect'
  },
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'buffer',                 keyword_length = 3 },
    { name = 'luasnip',                keyword_length = 2 },
    { name = 'nvim_lsp_signature_help' },
    -- { name = "cmp_r" },
    { name = 'otter' },
    {
      name = 'latex_symbols',
      option = {
        strategy = 0, -- mixed
      },
    },
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ["<Up>"] = cmp.mapping.select_prev_item(cmp_select_opts),
    ["<Down>"] = cmp.mapping.select_next_item(cmp_select_opts),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<C-h>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<C-l>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      local col = vim.fn.col('.') - 1
      if cmp.visible() then
        cmp.select_next_item(cmp_select_opts)
      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        fallback()
      else
        cmp.complete()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(cmp_select_opts)
      else
        fallback()
      end
    end, { "i", "s" })
  },
  formatting = {
    -- use `lspkind` to format
    format = lspkind.cmp_format({
      -- before = function(entry, vim_item)
      --   -- source
      --   vim_item.menu = ({
      --     buffer = "[Buffer]",
      --     nvim_lsp = "[LSP]",
      --     luasnip = "[Snippet]",
      --     nvim_lua = "[Lua]",
      --     latex_symbols = "[LaTeX]",
      --   })[entry.source.name]
      --   return vim_item
      -- end
    })
  },
  experimental = {
    ghost_text = true,
  },
  -- window = {
  --   completion = cmp.config.window.bordered(),
  --   documentation = cmp.config.window.bordered()
  -- },
})

-- require("cmp_r").setup({ })
