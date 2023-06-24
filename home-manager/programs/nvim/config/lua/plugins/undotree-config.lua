local opts = { noremap = true }

require("legendary").keymaps({
  { "<leader>z", vim.cmd.UndotreeToggle, description = "Toggle Undo Tree", opts = opts },
})
