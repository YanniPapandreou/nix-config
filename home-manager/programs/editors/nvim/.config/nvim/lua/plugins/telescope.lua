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
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	-- event = "VimEnter",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	keys = {
		{
			"<leader>ff",
			"<cmd>lua vim.find_files_from_project_git_root()<cr>",
			desc = "Telescope: Find Files From Project Root",
		},
		-- TODO: make this <leader>fd - and replace <leader><Space> with find from root?
		{ "<leader><Space>", "<cmd>Telescope find_files<cr>", desc = "Telescope: Find Files From CWD" },
		{ "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Telescope: Switch Buffer" },
		{ "<leader>/", "<cmd>lua live_grep_from_project_git_root()<cr>", desc = "Telescope: Grep in Files" },
		{ "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Telescope: Old Files" },
		{ "<leader>fr", "<cmd>Telescope lsp_references<cr>", desc = "Telescope: [R]eferences" },
		{ "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Telescope: Command History" },
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Telescope: Help Tags" },
		{ "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Telescope: Keymaps" },
    { "<leader>fH", ":Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>", desc = "Telescope: Find files including hidden" },
		{
			"<leader>en",
			function()
				require("telescope.builtin").find_files({
					cwd = vim.fn.stdpath("config"),
				})
			end,
			desc = "Telescope: [E]dit [N]eovim (search in Neovim config directory)",
		},
		{
			"<leader>ep",
			function()
				require("telescope.builtin").find_files({
					cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
				})
			end,
			desc = "Telescope: [E]dit [N]eovim packages (search in neovim package directory)",
		},
	},
	config = function()
		require("telescope").setup({

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
				},
			},

			extensions = {
				fzf = {},
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},

			pickers = {
				buffers = {
					theme = "ivy",
				},
				lsp_references = {
					theme = "ivy",
				},
				find_files = {
					theme = "ivy",
				},
				oldfiles = {
					theme = "ivy",
				},
				keymaps = {
					theme = "ivy",
				},
			},
		})

		-- Enable Telescope extensions if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		require("config.telescope.multigrep").setup()
	end,
}
