require("todo-comments").setup{}

local opts = { noremap = true }
require("legendary").keymaps({
  { "]t", function() require("todo-comments").jump_next() end, description = "TODO: Next Comment", opts = opts },
  { "[t", function() require("todo-comments").jump_prev() end, description = "TODO: Previous Comment", opts = opts },
  { "<leader>xt", "<cmd>TodoTrouble<cr>", description = "TODO: Trouble", opts = opts },
  { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", description = "TODO: Trouble (Todo/Fix/Fixme)", opts = opts },
  { "<leader>st", "<cmd>TodoTelescope<cr>", description = "TODO: Trouble Telescope", opts = opts },
})
