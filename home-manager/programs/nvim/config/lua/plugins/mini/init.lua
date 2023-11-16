-- require("mini.comment").setup()
require("mini.cursorword").setup()
require("mini.files").setup()
require("mini.indentscope").setup()
require("mini.jump").setup()
require("mini.jump2d").setup({
  mappings = {
    start_jumping = '<leader><CR>'
  },
})
require("mini.map").setup()
require("mini.move").setup()
require("mini.pairs").setup()
require("mini.surround").setup()

local starter = require("mini.starter")

local my_telescope_section = function()
  return function()
    return {
      -- {action = 'Telescope file_browser',    name = 'Browser',         section = 'Telescope'},
      -- {action = 'Telescope command_history', name = 'Command history', section = 'Telescope'},
      {action = 'Telescope find_files',      name = 'Files',           section = 'Telescope'},
      {action = 'Telescope help_tags',       name = 'Help tags',       section = 'Telescope'},
      {action = 'Telescope live_grep',       name = 'Live grep',       section = 'Telescope'},
      {action = 'Telescope oldfiles',        name = 'Old files',       section = 'Telescope'},
    }
  end
end

starter.setup({
  items = {
    starter.sections.sessions(5, true),
    -- starter.sections.telescope(),
    my_telescope_section(),
    starter.sections.recent_files(5, true),
    starter.sections.recent_files(5, false),
    starter.sections.builtin_actions(),
  }
})

require("mini.statusline").setup()
-- require("mini.tabline").setup()
require("mini.trailspace").setup()
require("mini.sessions").setup()

local bind = vim.keymap.set
bind('n', '<leader>o', ':lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<cr>', { desc = "Open File Explorer", noremap = true })
bind('n', '<leader>O', ':lua MiniFiles.open()<cr>', { desc = "Open File Explorer (from CWD)", noremap = true })
