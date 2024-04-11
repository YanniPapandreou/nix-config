require('telescope').setup({
  defaults = {
    -- winblend = 100,
    prompt_prefix = " ",
    selection_caret = " ",
    -- TODO: set up mappings like in Nepofiles
    -- TODO: set up extensions
  }
})

local opts = { noremap = true }
require('legendary').keymaps({
  { '<leader>,', '<cmd>Telescope buffers show_all_buffers=true<cr>', description = 'Telescope: Switch Buffer', opts = opts },
  { '<leader><Space>',
  --  function ()
  --    local tele_opts = {} -- define here if you want options
  --    vim.fn.system("git rev-parse --is-inside-work-tree")
  --    if vim.v.shell_error == 0 then
  --      require"telescope.builtin".git_files(tele_opts)
  --    else
  --      require"telescope.builtin".find_files(tele_opts)
  --    end
  --  end,
    '<cmd>Telescope find_files<cr>',
    description = "Telesecope: Find Files",
    opts = opts
  },
  { '<leader>/',
    -- function ()
    --   local function is_git_repo()
    --     vim.fn.system("git rev-parse --is-inside-work-tree")
    --     return vim.v.shell_error == 0
    --   end
    --
    --   local function get_git_root()
    --     local dot_git_path = vim.fn.finddir(".git", ".;")
    --     return vim.fn.fnamemodify(dot_git_path, ":h")
    --   end
    --
    --   local tele_opts = {}
    --
    --   if is_git_repo() then
    --     tele_opts = {
    --       cwd = get_git_root(),
    --     }
    --   end
    --
    --   require("telescope.builtin").live_grep(tele_opts)
    -- end,
    '<cmd>Telescope live_grep<cr>',
    description = "Telescope: Grep in files",
    opts = opts
  },
  { "<leader>:", "<cmd>Telescope command_history<cr>", description = "Telescope: Command History", opts = opts },
  { "<leader>sh", "<cmd>Telescope help_tags<cr>", description = "Telescope: Help Pages", opts = opts },
  { "<leader>sH", "<cmd>Telescope highlights<cr>", description = "Telescope: Highlight Groups", opts = opts },
  { "<leader>sM", "<cmd>Telescope man_pages<cr>", description = "Telescope: Man Pages", opts = opts },
  { "<leader>sw", "<cmd>Telescope marks<cr>", description = "Telescope: Jump to Mark", opts = opts },
  { "<leader>sc", "<cmd>Telescope command_history<cr>", description = "Telescope: Command History", opts = opts },
  { "<leader>sC", "<cmd>Telescope commands<cr>", description = "Telescope: Commands", opts = opts },
  { "<leader>.", "<cmd>Telescope oldfiles<cr>", description = "Telescope: Recent Files", opts = opts },
  { "<leader>fr", "<cmd>Telescope oldfiles<cr>", description = "Telescope: Recent Files", opts = opts },
  -- { "<leader>sr", "<cmd>Telescope oldfiles<cr>", description = "Telescope: Recent Files", opts = opts },
  { "<leader>sd", "<cmd>Telescope diagnostics<cr>", description = "Telescope: Diagnostics", opts = opts },
  { "<leader>uC", "<cmd>Telescope colorscheme<cr>", description = "Telescope: Colorschemes", opts = opts },
  { "<leader>sk", "<cmd>Telescope keymaps<cr>", description = "Telescope: Keymaps", opts = opts },

})
