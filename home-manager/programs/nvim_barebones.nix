{ pkgs, ... }:
{
  programs.neovim = {
    package = pkgs.neovim-nightly;
    enable = true;
    defaultEditor = true;

    withNodeJs = true;

    plugins = with pkgs.vimPlugins; [
      dracula-nvim
      telescope-nvim
      plenary-nvim
      nvim-autopairs
      comment-nvim 
      trouble-nvim
      todo-comments-nvim
      lualine-nvim
      which-key-nvim
      nvim-web-devicons
      gitsigns-nvim
      undotree
      toggleterm-nvim

      nvim-treesitter.withAllGrammars
      nvim-treesitter-textobjects
      
       nvim-lspconfig
       nvim-cmp
       cmp-nvim-lsp
       luasnip
       cmp-buffer
       cmp-path
       cmp_luasnip
       vim-illuminate
       cmp-nvim-lsp-signature-help
       lspkind-nvim
       # cmp-latex-symbols
       lspsaga-nvim
    ];

    extraPackages = with pkgs; [
      tree-sitter
      lua-language-server
      pyright
    ];

    extraLuaConfig = ''
-- options
local opt = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = ","

vim.cmd.colorscheme("dracula")

vim.scriptencoding= 'utf-8'
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

opt.hlsearch = true
opt.incsearch = true

opt.showcmd = true
opt.cmdheight = 1
opt.laststatus = 2

opt.expandtab = true
opt.scrolloff = 8
opt.breakindent = true
opt.backspace = { 'start', 'eol', 'indent' }

opt.cursorline = true
opt.inccommand = "nosplit"
opt.list = true
opt.smartcase = true
opt.spelllang = { "en" }
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true

-- globals
P = function(v)
  print(vim.inspect(v))
  return v
end

Toggle = function(option, silent, values)
  if values then
    if vim.opt_local[option]:get() == values[1] then
      vim.opt_local[option] = values[2]
    else
      vim.opt_local[option] = values[1]
    end
    print("Set " .. option .. " to " .. vim.opt_local[option]:get())
    return
  end
  vim.opt_local[option] = not vim.opt_local[option]:get()
  if not silent then
    if vim.opt_local[option]:get() then
      print("Enabled " .. option)
    else
      print("Disabled " .. option)
    end
  end
end

-- keymaps
local bind = vim.keymap.set
bind('n', '<C-s>', '<cmd>w<cr><esc>', { desc = "Save file" })
bind('n', '<leader>qq', '<cmd>qa<cr>', { desc = "Quit all" })


bind("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
bind("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
bind("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
bind("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
bind("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
bind("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize window using <ctrl> arrow keys
bind("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
bind("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
bind("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
bind("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
bind("n", "<A-j>", ":m .+1<cr>==", { desc = "Move down" })
bind("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
bind("i", "<A-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move down" })
bind("n", "<A-k>", ":m .-2<cr>==", { desc = "Move up" })
bind("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
bind("i", "<A-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move up" })

-- buffers
bind("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
bind("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
bind("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
bind("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
bind("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
bind("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
bind("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete Buffer" })

-- Clear search with <esc>
bind({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
bind("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
bind("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
bind("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
bind("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
bind("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
bind("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- better indenting
bind("v", "<", "<gv")
bind("v", ">", ">gv")

-- windows
bind("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
bind("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
bind("n", "<leader>w-", "<C-W>s", { desc = "Split window below" })
bind("n", "<leader>w|", "<C-W>v", { desc = "Split window right" })
bind("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
bind("n", "<leader>|", "<C-W>v", { desc = "Split window right" })

bind("x", "<leader>p", "\"_dP", { desc = "Paste over without deleting register" })

bind("n", "<leader>y", "\"+y", { desc = "Yank to system clipboard" })
bind("v", "<leader>y", "\"+y", { desc = "Yank to system clipboard" })
bind("n", "<leader>Y", "\"+Y", { desc = "Yank to system clipboard" })

-- Toggles
bind("n", "<leader>us", function() Toggle("spell") end, { desc = "Toggle Spelling"} )
bind("n", "<leader>uw", function() Toggle("wrap") end, { desc = "Toggle Word Wrap"} )
bind("n", "<leader>ul", function() Toggle("relativenumber") Toggle("number") end, { desc = "Toggle Line Numbers"} )
bind("n", "<leader>uc", function() Toggle("conceallevel", false, {0, conceallevel}) end, { desc = "Toggle Conceal"} )

bind("n", "<leader>e", "<cmd>Exp<cr>", { desc = "Open file explorer" })

bind("n", "<leader>z", vim.cmd.UndotreeToggle, { desc = "Toggle Undo Tree", noremap = true })

-- autocmds
-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, { command = "checktime" })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "qf",
    "help",
    "man",
    "notify",
    "lspinfo",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "PlenaryTestPopup",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- plugins

-- telescope
local telescope = require("telescope")

telescope.setup({
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
  }
})

function vim.find_files_from_project_git_root()
  local function is_git_repo()
    vim.fn.system("git rev-parse --is-inside-work-tree")
    return vim.v.shell_error == 0
  end
  local function get_git_root()
    local dot_git_path = vim.fn.finddir(".git", ".;")
    return vim.fn.fnamemodify(dot_git_path, ":h")
  end
  local opts = {}
  if is_git_repo() then
    opts = {
      cwd = get_git_root(),
    }
  end
  require("telescope.builtin").find_files(opts)
end

function live_grep_from_project_git_root()
	local function is_git_repo()
		vim.fn.system("git rev-parse --is-inside-work-tree")

		return vim.v.shell_error == 0
	end

	local function get_git_root()
		local dot_git_path = vim.fn.finddir(".git", ".;")
		return vim.fn.fnamemodify(dot_git_path, ":h")
	end

	local opts = {}

	if is_git_repo() then
		opts = {
			cwd = get_git_root(),
		}
	end

	require("telescope.builtin").live_grep(opts)
end

bind('n', '<leader>,', '<cmd>Telescope buffers show_all_buffers=true<cr>', { desc = 'Telescope: Switch Buffer', noremap = true  })
--bind('n', '<leader><Space>', '<cmd>Telescope find_files<cr>', { desc = 'Telescope: Find Files', noremap = true  })
bind('n', '<leader><Space>', '<cmd>lua vim.find_files_from_project_git_root()<cr>', { desc = 'Telescope: Find Files', noremap = true  })
bind('n', '<leader>fg', '<cmd>Telescope git_files<cr>', { desc = 'Telescope: Find Git Files', noremap = true  })
--bind('n', '<leader>/', '<cmd>Telescope live_grep<cr>', { desc = 'Telescope: Grep in Files', noremap = true  })
bind('n', '<leader>/', '<cmd>lua live_grep_from_project_git_root()<cr>', { desc = 'Telescope: Grep in Files', noremap = true  })
bind('n', '<leader>:', '<cmd>Telescope command_history<cr>', { desc = 'Telescope: Command History', noremap = true  })
bind('n', '<leader>fc', '<cmd>Telescope commands<cr>', { desc = 'Telescope: Commands', noremap = true  })
bind('n', '<leader>.', '<cmd>Telescope oldfiles<cr>', { desc = 'Telescope: Recent Files', noremap = true  })
bind('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>', { desc = 'Telescope: Diagnostics', noremap = true  })
bind('n', '<leader>fC', '<cmd>Telescope colorscheme<cr>', { desc = 'Telescope: Colorschemes', noremap = true  })
bind('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', { desc = 'Telescope: Keymaps', noremap = true  })
bind('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = 'Telescope: Help Tags', noremap = true  })

-- autopairs
require('nvim-autopairs').setup({
  fast_wrap = {},
})

-- comments
require("Comment").setup()

-- trouble
require("trouble").setup({
  use_diagnostic_signs = true,
})

local opts = { noremap = true }
bind('n', '<leader>xx', '<cmd>TroubleToggle document_diagnostics<cr>', {desc = "Trouble: Document Diagnostics", noremap = true } )
bind('n', '<leader>xX', '<cmd>TroubleToggle workspace_diagnostics<cr>', {desc = "Trouble: Workspace Diagnostics", noremap = true } )

-- todo-comments
require("todo-comments").setup{}
bind("n", "]t", function() require("todo-comments").jump_next() end, { desc = "TODO: Next Comment", noremap = true})
bind("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "TODO: Previous Comment", noremap = true})
bind("n", "<leader>xt", "<cmd>TodoTrouble<cr>", { desc = "TODO: Trouble", noremap = true})
bind("n", "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", { desc = "TODO: Trouble (Todo/Fix/Fixme)", noremap = true})
bind("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "TODO: Trouble Telescope", noremap = true})

-- lualine
require("lualine").setup()

-- lspconfig
local nvim_lsp = require("lspconfig")
local lspsaga = require('lspsaga')

lspsaga.setup({
  ui = {
    border = "rounded",
  }
})

local on_attach = function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  require("illuminate").on_attach(client)

  -- Mappings
  local bind = vim.keymap.set
  bind('n', 'gd', '<cmd>Lspsaga goto_definition<cr>', {desc = 'LSP: Go to definition', noremap=true, silent=true, buffer=true})
  bind('n', 'gD', vim.lsp.buf.declaration, {desc = 'LSP: Go to Declaration', noremap=true, silent=true, buffer=true})
  bind('n', 'gh', '<cmd>Lspsaga lsp_finder<cr>', {desc = 'LSP: Go Hunt', noremap=true, silent=true, buffer=true})
  bind('n', 'K', '<cmd>Lspsaga hover_doc<cr>', {desc = 'LSP: Hover', noremap=true, silent=true, buffer=true})
  bind('n', 'gp', '<cmd>Lspsaga peek_definition<cr>', {desc = 'LSP: Go Peek Definition', noremap=true, silent=true, buffer=true})
  bind('n', '<leader>K', '<cmd>Lspsaga hover_doc ++keep<cr>', {desc = 'LSP: Hover (Keep)', noremap=true, silent=true, buffer=true})
  bind('n', 'gs', vim.lsp.buf.signature_help, {desc = 'LSP: Signature Help', noremap=true, silent=true, buffer=true})
  bind('n', 'gi', vim.lsp.buf.implementation, {desc = 'LSP: Go to Implementation', noremap=true, silent=true, buffer=true})
  bind('n', '<leader>ca', '<cmd>Lspsaga code_action<cr>', {desc = 'LSP: Code Action', noremap=true, silent=true, buffer=true})
  bind('n', '<leader>co', '<cmd>Lspsaga outline<cr>', {desc = 'LSP: Code Outline', noremap=true, silent=true, buffer=true})
  bind('n', '<leader>cb', '<cmd>Lspsaga show_buf_diagnostics<cr>', {desc = 'LSP: Show Buffer Diagnostics', noremap=true, silent=true, buffer=true})
  bind('n', 'gl', '<cmd>Lspsaga show_line_diagnostics<cr>', {desc = 'LSP: Show Line Diagnostics', noremap=true, silent=true, buffer=true})
  bind('n', 'gr', vim.lsp.buf.references, {desc = 'LSP: Show References', noremap=true, silent=true, buffer=true})
  bind('n', '[d', function() vim.diagnostic.goto_prev({ float = {border = "single"}}) end, { desc = 'Diagnostics: Previous', noremap=true, silent=true, buffer=true})
  bind('n', ']d', function() vim.diagnostic.goto_next({ float = {border = "single"}}) end, { desc = 'Diagnostics: Next', noremap=true, silent=true, buffer=true})
  bind('n', '<leader>q', vim.diagnostic.setloclist, {desc = 'Diagnostics: Show location list', noremap=true, silent=true, buffer=true})
  bind('n', '<leader>cf', vim.lsp.buf.format, {desc = 'LSP: Format File', noremap=true, silent=true, buffer=true})
  bind('n', '<F2>', '<cmd>Lspsaga rename<cr>', {desc = 'LSP: Rename', noremap=true, silent=true, buffer=true })
end

local signs = {
  Error = ' ',
  Warn = ' ',
  Hint = ' ',
  Info = ' '
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- setup language servers
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local function default_lsp_setup(module)
  nvim_lsp[module].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

default_lsp_setup("pyright")

-- cmp config
local cmp = require("cmp")
local luasnip = require("luasnip")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local lspkind = require("lspkind")

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

cmp.setup({
  preselect = 'none',
  completion = {
    completeopt = "menu,menuone,noinsert,noselect",
  },
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'buffer', keyword_length = 3},
    {name = 'luasnip', keyword_length = 2},
    {name = 'nvim_lsp_signature_help'},
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
    ['<CR>'] = cmp.mapping.confirm({select = true}),
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
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  }, 
  experimental = {
    ghost_text = true,
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
})

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

require('luasnip.loaders.from_vscode').lazy_load()
-- load custom snippets
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })


require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-`>]],
  autochdir = true, -- when neovim changes it current directory the terminal will change it's own when next it's opened
  direction = 'float',
}


-- custom terminals
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
bind("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<cr>", { desc = "Open Lazygit", noremap = true, silent = true})
bind("n", "<leader>th", ":ToggleTerm direction=horizontal<cr>", { desc = "Open terminal horizontally", noremap = true })
bind("n", "<leader>tv", ":ToggleTerm direction=vertical<cr>", { desc = "Open terminal vertically", noremap = true })
bind("n", "<leader>tf", ":ToggleTerm direction=float<cr>", { desc = "Open terminal as floating window", noremap = true })

local gitsigns = require("gitsigns")

gitsigns.setup({
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  on_attach = function(buffer)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, desc)
      vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
    end

    -- stylua: ignore start
    map("n", "]h", gs.next_hunk, "Next Hunk")
    map("n", "[h", gs.prev_hunk, "Prev Hunk")
    map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
    map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
    map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
    map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
    map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
    map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
    map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
    map("n", "<leader>ghd", gs.diffthis, "Diff This")
    map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
  end,
})

-- which-key
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
'';
 };
}
