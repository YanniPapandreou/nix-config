return {
	{
		"jpalardy/vim-slime",
		init = function()
			-- set Zellij as slime target
			vim.g.slime_target = "zellij"
			-- default config
			vim.cmd(
				[[let g:slime_default_config = {"session_id": "current", "relative_pane": "down", "relative_move_back": "up"}]]
			)
			vim.g.slime_dont_ask_default = 1

			-- disables default bindings
			vim.g.slime_no_mappings = 1

			local bind = vim.keymap.set

			local source_r_file = function()
				local path = vim.api.nvim_buf_get_name(0)
				local source_command = "source('" .. path .. "')"
				local vim_command = 'call slime#send("' .. source_command .. '\\n")'
				vim.cmd(vim_command)
			end

			bind("x", "<leader>r", "<Plug>SlimeRegionSend", { desc = "Slime: Send Visual Selection" })
			bind("n", "<leader>r", "<Plug>SlimeMotionSend", { desc = "Slime: Send based on motion or text object" })
			bind("n", "<leader>rr", "<Plug>SlimeLineSend", { desc = "Slime: Send line" })
			bind("n", "<leader>rp", "<Plug>SlimeParagraphSend", { desc = "Slime: Send [P]aragraph" })
			bind("n", "<leader><CR>", "<Plug>SlimeParagraphSend", { desc = "Slime: Send Paragraph" })
			bind("n", "<leader>rf", source_r_file, { desc = "Slime: Source R file" })
		end,
	},
}
