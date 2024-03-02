vim.o.timeout = true
vim.o.timeoutlen = 300

local wk = require("which-key")

wk.setup({
  plugins = {
    spelling = true
  },
})

wk.register({
  mode = { "n", "v" },
  ["]"] = { name = "+next" },
  ["["] = { name = "+prev" },
  ["<leader>b"] = { name = "+buffer" },
  ["<leader>c"] = { name = "+code" },
  ["<leader>f"] = { name = "+file/find" },
  ["<leader>g"] = { name = "+git" },
  ["<leader>gh"] = { name = "+hunks" },
  ["<leader>q"] = { name = "+quit/session" },
  ["<leader>f"] = { name = "+find" },
  -- ["<leader>sn"] = { name = "+noice" },
  ["<leader>u"] = { name = "+ui" },
  ["<leader>w"] = { name = "+windows" },
  ["<leader>x"] = { name = "+diagnostics/quickfix" },
})
