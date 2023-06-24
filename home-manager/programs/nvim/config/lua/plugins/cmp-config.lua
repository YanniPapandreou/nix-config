-- Autocompletion setup
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require('cmp')
local luasnip = require("luasnip")
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local lspkind = require('lspkind')

local cmp_select_opts = {behavior = cmp.SelectBehavior.Select}

luasnip.config.set_config({
  history = true,
  --region_check_events = 'InsertEnter'
  delete_check_events = 'InsertLeave',
  updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
  ext_opts = {
    [require("luasnip.util.types").choiceNode] = {
      active = {
        virt_text = { {" ", "Error" } ,}
      },
    },
  },
  -- store_selection_keys = '<c-s>'
})

-- load custom snippets
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))

cmp.setup({
  view = {
    entries = "native",
  },
  completion = {
    completeopt = 'menu,menuone,noselect'
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
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
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<C-h>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {"i", "s"}),
    ["<C-l>"] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, {"i", "s"}),
    ["<Tab>"] = cmp.mapping(function(fallback)
      local col = vim.fn.col('.') - 1
      if cmp.visible() then
        cmp.select_next_item(cmp_select_opts)
      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        fallback()
      else
        cmp.complete()
      end
    end, {"i", "s"}),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(cmp_select_opts)
      else
        fallback()
      end
    end, {"i", "s"})
    -- ["<Tab>"] = cmp.mapping(function(fallback)
    --     if cmp.visible() then
    --         cmp.select_next_item()
    --     elseif luasnip.expand_or_jumpable() then
    --         luasnip.expand_or_jump()
    --     elseif has_words_before() then
    --         cmp.complete()
    --     else
    --         fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
    --     end
    -- end, { "i", "s" }),
    -- ["<S-Tab>"] = cmp.mapping(function()
    --     if cmp.visible() then
    --         cmp.select_prev_item()
    --     elseif luasnip.jumpable(-1) then
    --         luasnip.jump(-1)
    --     end
    -- end, { "i", "s" })
  },
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'luasnip' },
  }, {
      { name = 'buffer' },
    }),
  formatting = {
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
    }),
  },
  experimental = {
    ghost_text = true;
  }
})

-- -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline('/', {
--   sources = {
--     { name = 'buffer' }
--   }
-- })

-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--   sources = cmp.config.sources({
--     { name = 'path' }
--   }, {
--       { name = 'cmdline' }
--     })
-- })

