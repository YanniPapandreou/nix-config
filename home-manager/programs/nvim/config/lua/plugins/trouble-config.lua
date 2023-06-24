require("trouble").setup({
  use_diagnostic_signs = true,
})

local opts = { noremap = true }
require("legendary").keymaps({
  { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", description = "Trouble: Document Diagnostics", opts = opts},
  { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", description = "Trouble: Workspace Diagnostics", opts = opts},
})
