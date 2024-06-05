require('gitpad').setup({
  dir = "~/Notes/gitpad",
})

local bind = vim.keymap.set
bind('n', '<leader>pp', function() require('gitpad').toggle_gitpad({ title = 'Project Notes' }) end, { desc = "Toggle Gitpad Project"})
bind('n', '<leader>pb', function() require('gitpad').toggle_gitpad({ title = 'Branch Notes' }) end, { desc = "Toggle Gitpad Branch"})
bind(
  'n',
  '<leader>pd',
  function()
    local date_filename = 'daily-' .. os.date('%Y-%m-%d.md')
    require('gitpad').toggle_gitpad({ filename = date_filename, title = "Daily notes" })
  end,
  { desc = "Toggle Gitpad Daily" }
)
bind(
  'n',
  '<leader>pf',
  function()
    local filename = vim.fn.expand('%:p') -- or just use vim.fn.bufname()
    if filename == '' then
      vim.notify('empty bufname')
      return
    end
    filename = vim.fn.pathshorten(filename, 2) .. '.md'
    require('gitpad').toggle_gitpad({ filename = filename, title = "Current file notes" })
  end,
  { desc = "Toggle Gitpad Per File" }
)
