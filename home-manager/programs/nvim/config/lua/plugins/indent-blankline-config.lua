-- vim.opt.list = true
vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
  space_char_blankline = " ",
  filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble" },
  show_trailing_blankline_indent = false,
  show_current_context = false,
}
