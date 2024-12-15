local function get_visual_selection()
  local vstart = vim.fn.getpos("'<")
  local vend = vim.fn.getpos("'>")
  local text = vim.fn.getregion(vstart, vend)
  return text
end


local function send_line_to_zellij()
  -- yank the current line into register
  vim.cmd('normal! "xyy')

  -- Get the yanked text from the "x" register
  local text = vim.fn.getreg("x")

  -- Split the text into lines
  local lines = vim.split(text, "\n", { trimempty = true })

  vim.fn.system("zellij action move-focus down")
  -- vim.fn.system(string.format('zellij action write-chars "%s"', text))
  -- vim.fn.system("zellij action write 10")

  -- Send each line individually to the Zellij pane
  for _, line in ipairs(lines) do
      -- Escape double quotes in the text
      line = line:gsub('"', '\\"')
      vim.fn.system(string.format('zellij action write-chars "%s"', line))
      vim.fn.system("zellij action write 10")
  end

  -- return focus to original pane
  vim.fn.system("zellij action move-focus up")

  -- move down
  vim.fn.feedkeys('j')
end

local function send_visual_selection_to_zellij()
  local lines = get_visual_selection()

  vim.fn.system("zellij action move-focus down")

  -- Send each line individually to the Zellij pane
  for _, line in ipairs(lines) do
      -- Escape double quotes in the text
      line = line:gsub('"', '\\"')
      vim.fn.system(string.format('zellij action write-chars "%s"', line))
      vim.fn.system("zellij action write 10")
  end

  -- return focus to original pane
  vim.fn.system("zellij action move-focus up")

  -- highlight region again
  vim.cmd('normal! gv')
end

-- create a Vim command to call the functions
vim.api.nvim_create_user_command("SendLineToZellij", send_line_to_zellij, {})
vim.api.nvim_create_user_command("SendVisualSelectionToZellij", send_visual_selection_to_zellij, {})

-- setup keybinds when entering R files for these mappings:
vim.api.nvim_create_augroup("RFileBindings", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = "RFileBindings",
  pattern = "r",
  callback = function()
    print("entered R file, setting up zellij-repl keybinds")
    vim.keymap.set("n", "<leader><CR>", ":SendLineToZellij<CR>", { buffer = true })
    vim.keymap.set("v", "<leader><CR>", ":<C-u>SendVisualSelectionToZellij<CR>", { buffer = true })
  end,
})
