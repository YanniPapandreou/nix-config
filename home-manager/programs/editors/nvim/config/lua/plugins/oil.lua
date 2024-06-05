require("oil").setup({
  keymaps = {
    ["<C-h>"] = false,
    ["<C-l>"] = false,
    ["<M-h>"] = false,
  },
})

vim.keymap.set('n', '<leader>o', '<cmd>Oil<cr>', { desc = "Oil: Open File Explorer", noremap = true })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
