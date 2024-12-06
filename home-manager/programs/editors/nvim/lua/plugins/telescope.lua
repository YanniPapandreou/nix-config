-- keymaps
function vim.find_files_from_project_git_root()
  local function is_git_repo()
    vim.fn.system("git rev-parse --is-inside-work-tree")
    return vim.v.shell_error == 0
  end
  local function get_git_root()
    local dot_git_path = vim.fn.finddir(".git", ".;")
    return vim.fn.fnamemodify(dot_git_path, ":h")
  end
  local opts = {}
  if is_git_repo() then
    opts = {
      cwd = get_git_root(),
    }
  end
  require("telescope.builtin").find_files(opts)
end

function live_grep_from_project_git_root()
  local function is_git_repo()
    vim.fn.system("git rev-parse --is-inside-work-tree")

    return vim.v.shell_error == 0
  end

  local function get_git_root()
    local dot_git_path = vim.fn.finddir(".git", ".;")
    return vim.fn.fnamemodify(dot_git_path, ":h")
  end

  local opts = {}

  if is_git_repo() then
    opts = {
      cwd = get_git_root(),
    }
  end

  require("telescope.builtin").live_grep(opts)
end


return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  -- event = "VimEnter",
  lazy = false,
  dependencies = { 
    'nvim-lua/plenary.nvim',
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  keys = {
    { "<leader>ff", "<cmd>lua vim.find_files_from_project_git_root()<cr>", desc = "Telescope: Find Files From Project Root" },
    { "<leader><Space>", "<cmd>Telescope find_files<cr>", desc = "Telescope: Find Files From CWD"},
    { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Telescope: Switch Buffer" },
    { "<leader>/", "<cmd>lua live_grep_from_project_git_root()<cr>", desc = "Telescope: Grep in Files" },
    { "<leader>.", "<cmd>Telescope oldfiles<cr>", desc = "Telescope: Recent Files" },
    { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Telescope: Command History" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Telescope: Help Tags"},
    { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Telescope: Keymaps"},
    -- TODO: add more keymaps as required
  },
  config = function()
    require('telescope').setup {

      defaults = {
        prompt_prefix = "  ",
        selection_caret = " ",

        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            preview_width = 0.5, -- Set the preview window to take 60% of the total width
            width = 0.8, -- Set the total width of the picker (adjust as needed)
            prompt_position = "bottom", -- Optional: Adjust the position of the prompt
          },
        }
      },

      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- TODO: look at keybind examples from kickstarter.nvim

    -- use telescope find_files instead of netrw
    -- vim.api.nvim_create_autocmd("VimEnter", {
    --   callback = function ()
    --     local loaded_netrw = vim.g.loaded_netrw
    --     local loaded_netrwPlugin = vim.g.loaded_netrwPlugin
    --     vim.g.loaded_netrw = 1
    --     vim.g.loaded_netrwPlugin = 1
    --     local directory = vim.fn.argv(0) -- Get the first argument
    --     if vim.fn.isdirectory(directory) == 1 then
    --       vim.cmd.cd(directory) -- change to the directory
    --       require("telescope.builtin").find_files()
    --     end
    --     vim.g.loaded_netrw = loaded_netrw
    --     vim.g.loaded_netrwPlugin = loaded_netrwPlugin
    --   end,
    -- })

  end
}
