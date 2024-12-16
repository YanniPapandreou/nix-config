return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		-- add any options here
		cmdline = {
			enabled = true,
			view = "cmdline_popup",
			-- view = "cmdline",
		},
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
	},
}
