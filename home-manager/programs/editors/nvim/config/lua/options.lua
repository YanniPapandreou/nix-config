local opt = vim.opt
local g = vim.g

-- set leader and localleader
g.mapleader = " "
g.maplocalleader = ","

-- neovide options
if g.neovide then
  g.neovide_remember_window_size = false
  vim.o.guifont = "FiraCode Nerd Font Mono:h11"
end

-- Themeing
local ColorMyPencils = function (color)
  color = color or "dracula"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
  vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
  -- vim.g.jukit_highlight_markers = 0
end
-- vim.cmd.colorscheme("dracula")
vim.cmd[[colorscheme tokyonight]]
ColorMyPencils("tokyonight")
-- vim.opt.background = "dark" -- set this to dark or light
-- vim.cmd.colorscheme "oxocarbon"
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--
-- vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
-- vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

opt.wrap = false
opt.number = true
opt.relativenumber = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2

opt.signcolumn = 'yes'

opt.autoindent = true
opt.smartindent = true

opt.swapfile = false
opt.backup = false
opt.undofile = true

opt.hlsearch = true -- highlight search options
opt.incsearch = true

opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2

opt.expandtab = true
opt.scrolloff = 8
opt.breakindent = true
opt.backspace = { 'start', 'eol', 'indent' }

opt.cursorline = true -- Enable highlighting of the current line
opt.inccommand = "nosplit" -- preview incremental substitute
opt.list = true -- show some invisible characters (tabs...)
opt.smartcase = true -- Don't ignore case with capitals
opt.spelllang = { "en" }
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.termguicolors = true -- True color support

-- Fix markdown indentation settings
g.markdown_recommended_style = 0

-- markdown preview settings
g.mkdp_auto_close = 0
g.mkdp_browser = 'brave'

-- conceal settings - Neorg
-- opt.conceallevel = 3