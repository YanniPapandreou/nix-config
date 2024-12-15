return {
	"stevearc/oil.nvim",
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		keymaps = {
			["<C-h>"] = false,
			["<C-l>"] = false,
			["<M-h>"] = false,
		},
		-- default_file_explorer = false,
	},
	lazy = false,
	-- Optional dependencies
	-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	keys = {
		{ "<leader>o", "<cmd>Oil<cr>", desc = "Oil: Open File Explorer" },
	},
}
