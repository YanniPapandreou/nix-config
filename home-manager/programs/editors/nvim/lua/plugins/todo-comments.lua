return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufEnter",
    -- opts = {
    --   -- your configuration comes here
    --   -- or leave it empty to use the default settings
    --   -- refer to the configuration section below
    -- },
    config = function()
      require("todo-comments").setup{}
      local bind = vim.keymap.set

      bind("n", "]t", function() require("todo-comments").jump_next() end, { desc = "TODO: Next Comment", noremap = true})
      bind("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "TODO: Previous Comment", noremap = true})
      bind("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "TODO: Trouble Telescope", noremap = true})
    end
}
