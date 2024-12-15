local opt = vim.opt
local g = vim.g

-- set leader and localleader
g.mapleader = " "
g.maplocalleader = ","

vim.g.clipboard = {
	name = "OSC 52",
	copy = {
		["+"] = require("vim.ui.clipboard.osc52").copy("+"),
		["*"] = require("vim.ui.clipboard.osc52").copy("*"),
	},
	paste = {
		["+"] = require("vim.ui.clipboard.osc52").paste("+"),
		["*"] = require("vim.ui.clipboard.osc52").paste("*"),
	},
}

vim.scriptencoding = "utf-8"
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

g.have_nerd_font = true

opt.wrap = false
opt.number = true
opt.relativenumber = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2

opt.signcolumn = "yes"

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
opt.backspace = { "start", "eol", "indent" }

opt.cursorline = true -- Enable highlighting of the current line
opt.inccommand = "nosplit" -- preview incremental substitute
opt.list = true -- show some invisible characters (tabs...)
opt.listchars = { tab = "  ", trail = "·" }
opt.smartcase = true -- Don't ignore case with capitals
opt.spelllang = { "en" }
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.termguicolors = true -- True color support
