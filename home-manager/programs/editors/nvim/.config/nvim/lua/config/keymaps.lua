local bind = vim.keymap.set

bind("n", "<leader>w", "<cmd>w<cr><esc>", { desc = "Save file" })
-- bind('n', '<leader>qq', '<cmd>qa<cr>', { desc = "Quit all" })

bind("n", "<leader><space>x", "<cmd>source %<CR>", { desc = "Source Lua file" })
bind("n", "<leader>x", ":.lua<CR>", { desc = "Run line of Lua code" })
bind("v", "<leader>x", ":lua<CR>", { desc = "Run visual selection of Lua code" })

bind("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
bind("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })

bind("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
bind("n", "<leader>|", "<C-W>v", { desc = "Split window right" })

-- Move to window using the <space> hjkl keys
bind("n", "<leader>h", "<C-w>h", { desc = "Go to left window" })
bind("n", "<leader>j", "<C-w>j", { desc = "Go to lower window" })
bind("n", "<leader>k", "<C-w>k", { desc = "Go to upper window" })
bind("n", "<leader>l", "<C-w>l", { desc = "Go to right window" })

-- Resize window using <space> arrow keys
bind("n", "<leader><Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
bind("n", "<leader><Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
bind("n", "<leader><Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
bind("n", "<leader><Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

bind("n", "<leader>ts", function()
	Toggle("spell")
end, { desc = "Toggle Spelling" })
bind("n", "<leader>tw", function()
	Toggle("wrap")
end, { desc = "Toggle Word Wrap" })
bind("n", "<leader>tl", function()
	Toggle("relativenumber")
end, { desc = "Toggle Line Numbers" })
local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
bind("n", "<leader>tc", function()
	Toggle("conceallevel", false, { 0, conceallevel })
end, { desc = "Toggle Conceal" })

-- bind("n", "]q", "<cmd>cnext<cr>", { desc = "Go to next quick fix item"})
-- bind("n", "[q", "<cmd>cprevious<cr>", { desc = "Go to next quick fix item"})

-- better up/down
bind("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
bind("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

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

bind("x", "<leader>p", '"_dP', { desc = "Paste over without deleting register" })
bind("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
bind("v", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
bind("n", "<leader>Y", '"+Y', { desc = "Yank to system clipboard" })

vim.cmd([[:tnoremap <Esc> <C-\><C-n>]])
bind("n", "<C-d>", "<C-d>zz")
bind("n", "<C-u>", "<C-u>zz")

-- remaping some editing commands to be more like Helix
-- bind("n", "mm", "%")
-- bind("n", "%", "ggVG")
bind("n", "ge", "G", { desc = "Go to buffer end" })
-- bind("n", "gh", "0", { desc = "Go to line start" } )
-- bind("n", "gl", "$", { desc = "Go to line end" } )
bind("n", "U", "<C-r>")
bind("n", "<C-r>", "U")

bind("n", "<leader>ct", "<cmd>lua Trim()<cr>", { desc = "[T]rim trailing whitespace" })
