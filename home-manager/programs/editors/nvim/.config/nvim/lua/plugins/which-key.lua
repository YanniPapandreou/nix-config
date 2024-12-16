return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		plugins = {
			spelling = true,
		},
		icons = {
			separator = "->",
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
	config = function(_, opts)
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		local wk = require("which-key")
		wk.setup(opts)

		wk.add({
			{ "]", group = "next" },
			{ "[", group = "prev" },
			{ "<leader>t", group = "Toggle" },
			{ "<leader>g", group = "Git" },
		})
	end,
}
