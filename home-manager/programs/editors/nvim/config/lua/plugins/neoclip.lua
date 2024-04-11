require("telescope").load_extension('neoclip')
require('neoclip').setup()

vim.keymap.set('n', '<leader>fv', '<cmd>Telescope neoclip<cr>', { desc = 'Telescope: Find in Clipboard', noremap = true })
