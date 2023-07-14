-- TODO: change to legendary style keymaps

local bind = vim.keymap.set

bind('n', '<C-s>', '<cmd>w<cr><esc>', { desc = "Save file" })
bind('n', '<leader>qq', '<cmd>qa<cr>', { desc = "Quit all" })
--bind('n', '<leader>e', '<cmd>Neotree toggle<cr>', { desc = "Toggle Explorer" })

-- bind('i', 'jk', '<Esc>')
--bind('n', '<leader>L', '<cmd>Lazy<cr>', { desc = "Lazy" })

-- better up/down
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

--bind("n", "<leader>us", function() Util.toggle("spell") end, { desc = "Toggle Spelling" })
--bind("n", "<leader>uw", function() Util.toggle("wrap") end, { desc = "Toggle Word Wrap" })
--bind("n", "<leader>ul", function() Util.toggle("relativenumber", true) Util.toggle("number") end, { desc = "Toggle Line Numbers" })
--bind("n", "<leader>ud", Util.toggle_diagnostics, { desc = "Toggle Diagnostics" })
--local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
--bind("n", "<leader>uc", function() Util.toggle("conceallevel", false, {0, conceallevel}) end, { desc = "Toggle Conceal" })

bind("x", "<leader>p", "\"_dP", { desc = "Paste over without deleting register" })

bind("n", "<leader>y", "\"+y", { desc = "Yank to system clipboard" })
bind("v", "<leader>y", "\"+y", { desc = "Yank to system clipboard" })
bind("n", "<leader>Y", "\"+Y", { desc = "Yank to system clipboard" })

-- bind("n", "<leader>d", "\"_d", { desc = "Delete and yank to system clipboard"})
-- bind("v", "<leader>d", "\"_d", { desc = "Delete and yank to system clipboard"})

-- lazygit
--bind("n", "<leader>gg", function() Util.float_term({ "lazygit" }, { cwd = Util.get_root() }) end, { desc = "Lazygit (root dir)" })
--bind("n", "<leader>gG", function() Util.float_term({ "lazygit" }) end, { desc = "Lazygit (cwd)" })

--bind("n", "<leader><leader>x", ":w<cr> :source %<cr>", { desc = "Write and source current file" })

-- Toggles
bind("n", "<leader>us", function() Toggle("spell") end, { desc = "Toggle Spelling"} )
bind("n", "<leader>uw", function() Toggle("wrap") end, { desc = "Toggle Word Wrap"} )
bind("n", "<leader>ul", function() Toggle("relativenumber") Toggle("number") end, { desc = "Toggle Line Numbers"} )
bind("n", "<leader>uc", function() Toggle("conceallevel", false, {0, conceallevel}) end, { desc = "Toggle Conceal"} )

--vim.cmd([[
--imap <silent><expr> <S-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<S-E>'
--smap <silent><expr> <S-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<S-E>'
--]])
