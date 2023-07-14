local actions = require("telescope.actions")
local bind = vim.keymap.set

require('telescope').setup({
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
--    mappings = {
--      i = {
--        ["<esc>"] = actions.close
--      },
--    },
  },
})

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

bind('n', '<leader>,', '<cmd>Telescope buffers show_all_buffers=true<cr>', { desc = 'Telescope: Switch Buffer', noremap = true  })
--bind('n', '<leader><Space>', '<cmd>Telescope find_files<cr>', { desc = 'Telescope: Find Files', noremap = true  })
bind('n', '<leader><Space>', '<cmd>lua vim.find_files_from_project_git_root()<cr>', { desc = 'Telescope: Find Files', noremap = true  })
bind('n', '<leader>fg', '<cmd>Telescope git_files<cr>', { desc = 'Telescope: Find Git Files', noremap = true  })
--bind('n', '<leader>/', '<cmd>Telescope live_grep<cr>', { desc = 'Telescope: Grep in Files', noremap = true  })
bind('n', '<leader>/', '<cmd>lua live_grep_from_project_git_root()<cr>', { desc = 'Telescope: Grep in Files', noremap = true  })
bind('n', '<leader>:', '<cmd>Telescope command_history<cr>', { desc = 'Telescope: Command History', noremap = true  })
bind('n', '<leader>fc', '<cmd>Telescope commands<cr>', { desc = 'Telescope: Commands', noremap = true  })
bind('n', '<leader>.', '<cmd>Telescope oldfiles<cr>', { desc = 'Telescope: Recent Files', noremap = true  })
bind('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>', { desc = 'Telescope: Diagnostics', noremap = true  })
bind('n', '<leader>fC', '<cmd>Telescope colorscheme<cr>', { desc = 'Telescope: Colorschemes', noremap = true  })
bind('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', { desc = 'Telescope: Keymaps', noremap = true  })
