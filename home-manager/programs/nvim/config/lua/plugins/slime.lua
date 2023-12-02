Quarto_is_in_python_chunk = function()
  require("otter.tools.functions").is_otter_language_context("python")
end

vim.cmd([[
let g:slime_dispatch_ipython_pause = 100
function SlimeOverride_EscapeText_quarto(text)
call v:lua.Quarto_is_in_python_chunk()
if exists('g:slime_python_ipython') && len(split(a:text,"\n")) > 1 && b:quarto_is_python_chunk
return ["%cpaste -q\n", g:slime_dispatch_ipython_pause, a:text, "--", "\n"]
else
return a:text
end
endfunction
]])

local function mark_terminal()
  vim.g.slime_last_channel = vim.b.terminal_job_id
  vim.print(vim.g.slime_last_channel)
end

local function set_terminal()
  vim.b.slime_config = { jobid = vim.g.slime_last_channel }
end

-- slime, neovvim terminal
vim.g.slime_target = "neovim"
vim.g.slime_python_ipython = 1

-- keymaps
local nmap = function(key, effect)
  vim.keymap.set("n", key, effect, { silent = true, noremap = true })
end

local vmap = function(key, effect)
  vim.keymap.set("v", key, effect, { silent = true, noremap = true })
end

local imap = function(key, effect)
  vim.keymap.set("i", key, effect, { silent = true, noremap = true })
end

-- send code with ctrl+Enter
-- just like in e.g. RStudio
-- needs kitty (or other terminal) config:
-- map shift+enter send_text all \x1b[13;2u
-- map ctrl+enter send_text all \x1b[13;5u
nmap("<c-cr>", "<Plug>SlimeSendCell")
nmap("<s-cr>", "<Plug>SlimeSendCell")
imap("<c-cr>", "<esc><Plug>SlimeSendCell<cr>i")
imap("<s-cr>", "<esc><Plug>SlimeSendCell<cr>i")

-- send code with Enter and leader Enter
vmap("<cr>", "<Plug>SlimeRegionSend")
nmap("<leader><cr>", "<Plug>SlimeSendCell")

local wk = require("which-key")

wk.register({
  ["<leader>cm"] = { mark_terminal, "mark terminal" },
  ["<leader>cs"] = { set_terminal, "set terminal" },
})
