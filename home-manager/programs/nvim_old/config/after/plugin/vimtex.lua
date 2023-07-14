vim.cmd([[
filetype plugin indent on

syntax enable
]])

vim.g.vimtex_view_method = 'sioyek'
vim.g.vimtex_quickfix_autoclose_after_keystrokes = 2
vim.g.vimtex_callback_progpath = "/home/yanni/.nix-profile/bin/nvim"
vim.g.vimtex_syntax_conceal = {
  accents = 0,
  cites = 1,
  fancy = 0,
  greek = 0,
  ligatures = 0,
  math_bounds = 0,
  math_delimiters = 0,
  math_fracs = 0,
  math_super_sub = 0,
  math_symbols = 0,
  sections = 0,
  spacing = 0,
  styles = 0,
}

local opts = { noremap = true }
require("legendary").keymaps({
  { "<M-f>", ":VimtexView<cr>", description = "Vimtex: Forward Search", opts = opts }
})
