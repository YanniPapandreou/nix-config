require("toggleterm").setup{
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-`>]],
  autochdir = true, -- when neovim changes it current directory the terminal will change it's own when next it's opened
  direction = 'float',
}


-- custom terminals
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})

-- keymaps
local opts = { noremap = true }
require("legendary").keymaps({
  { "<leader>gg", "<cmd>lua _lazygit_toggle()<cr>", description = "Open Lazygit", opts = { noremap = true, silent = true }},
  { "<leader>th", ":ToggleTerm direction=horizontal<cr>", description = "Open terminal horizontally", opts = opts },
  { "<leader>tv", ":ToggleTerm direction=vertical<cr>", description = "Open terminal vertically", opts = opts },
  { "<leader>tf", ":ToggleTerm direction=float<cr>", description = "Open terminal as floating window", opts = opts },
})
