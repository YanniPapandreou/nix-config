require("todo-comments").setup{}

local bind = vim.keymap.set

bind("n", "]t", function() require("todo-comments").jump_next() end, { desc = "TODO: Next Comment", noremap = true})
bind("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "TODO: Previous Comment", noremap = true})
bind("n", "<leader>xt", "<cmd>TodoTrouble<cr>", { desc = "TODO: Trouble", noremap = true})
bind("n", "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", { desc = "TODO: Trouble (Todo/Fix/Fixme)", noremap = true})
bind("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "TODO: Trouble Telescope", noremap = true})
