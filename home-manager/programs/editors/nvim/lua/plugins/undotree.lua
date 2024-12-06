return {
  "mbbill/undotree",
  config = function()
    vim.keymap.set("n", "<leader>z", vim.cmd.UndotreeToggle, { desc = "Toggle Undo Tree", noremap = true })
  end
}
