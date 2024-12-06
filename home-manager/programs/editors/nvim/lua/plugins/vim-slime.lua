return {
  {
    'jpalardy/vim-slime',
    init = function ()
      -- set Zellij as slime target
      vim.g.slime_target = "zellij"
      -- default config
      vim.cmd[[let g:slime_default_config = {"session_id": "current", "relative_pane": "down", "relative_move_back": "up"}]]
      vim.g.slime_dont_ask_default = 1

      -- disables default bindings
      vim.g.slime_no_mappings = 1

      local bind = vim.keymap.set

      bind("x", "<leader>s", "<Plug>SlimeRegionSend", { desc = "[S]lime: Send Visual Selection" })
      bind("n", "<leader>s", "<Plug>SlimeMotionSend", { desc = "[S]lime: Send based on motion or text object" })
      bind("n", "<leader>ss", "<Plug>SlimeLineSend", { desc = "[S]lime: Send line" })
      bind("n", "<leader>sp", "<Plug>SlimeParagraphSend", { desc = "[S]lime: Send [P]aragraph" })
      bind("n", "<leader><CR>", "<Plug>SlimeParagraphSend", { desc = "Slime: Send Paragraph" })
    end
  }
}
