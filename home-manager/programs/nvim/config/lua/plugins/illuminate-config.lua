require("illuminate").configure({ delay = 200 })

-- vim.api.nvim_create_autocmd("FileType", {
--   callback = function()
--     local buffer = vim.api.nvim_get_current_buf()
--     pcall(vim.keymap.del, "n", "]]", { buffer = buffer })
--     pcall(vim.keymap.del, "n", "[[", { buffer = buffer })
--   end,
-- })

local opts = { noremap=true, silent=true, buffer=true }
require("legendary").keymaps({
  { "]]", function() require("illuminate").goto_next_reference(false) end, description = "Next Reference", opts = opts },
  { "[[", function() require("illuminate").goto_prev_reference(false) end, description = "Previous Reference", opts = opts },
})
