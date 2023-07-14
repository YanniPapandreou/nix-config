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
local bind = vim.keymap.set

bind("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<cr>", { desc = "Open Lazygit", noremap = true, silent = true})
bind("n", "<leader>th", ":ToggleTerm direction=horizontal<cr>", { desc = "Open terminal horizontally", noremap = true })
bind("n", "<leader>tv", ":ToggleTerm direction=vertical<cr>", { desc = "Open terminal vertically", noremap = true })
bind("n", "<leader>tf", ":ToggleTerm direction=float<cr>", { desc = "Open terminal as floating window", noremap = true })

