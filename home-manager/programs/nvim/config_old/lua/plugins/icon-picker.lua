require("icon-picker").setup({
  disable_legacy_commands = true
})

local bind = vim.keymap.set

bind("n", "<Leader><Leader>i", "<cmd>IconPickerNormal<cr>", { desc = "Icon Picker (Normal)", noremap = true, silent = true })
bind("n", "<Leader><Leader>y", "<cmd>IconPickerYank<cr>", { desc = "Icon Picker (Yank)", noremap = true, silent = true })
bind("i", "<C-i>", "<cmd>IconPickerInsert<cr>", { desc = "Icon Picker (Normal)", noremap = true, silent = true })
