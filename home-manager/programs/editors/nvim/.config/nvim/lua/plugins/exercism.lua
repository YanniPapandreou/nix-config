return {
	"2kabhishek/exercism.nvim",
	cmd = {
		"ExercismLanguages",
		"ExercismList",
		"ExercismSubmit",
		"ExercismTest",
	},
	keys = {
		{ "<leader>exa", desc = "[Ex]ercism: Languages" },
		{ "<leader>exl", desc = "[Ex]ercism: List" },
		{ "<leader>exs", desc = "[Ex]ercism: Test" },
		{ "<leader>ext", desc = "[Ex]ercism: Submit" },
	},
	dependencies = {
		"2kabhishek/utils.nvim", -- required, for utility functions
		-- 'stevearc/dressing.nvim', -- optional, highly recommended, for fuzzy select UI
		-- '2kabhishek/termim.nvim', -- optional, better UX for running tests
	},
	-- Add your custom configs here, keep it blank for default configs (required)
	opts = {
		exercism_workspace = "~/exercism",
		default_language = "lua",
		add_default_keybindings = true,
		icons = {
			concept = "", -- Icon for concept exercises
			practice = "", -- Icon for practice exercises
		},
	},
}
