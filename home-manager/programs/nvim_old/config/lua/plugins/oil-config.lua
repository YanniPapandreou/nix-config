require("oil").setup()

local opts = { noremap = true }
require("legendary").keymaps({
  { "<leader>o", ":Oil<cr>", description = "Oil: Open File Explorer", opts = opts },
})
