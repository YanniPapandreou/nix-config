require("spectre").setup()

local opts = { noremap = true }
require("legendary").keymaps({
  { "<leader>sr", function() require("spectre").open() end, description = "Spectre: Replace in files", opts = opts },
})
