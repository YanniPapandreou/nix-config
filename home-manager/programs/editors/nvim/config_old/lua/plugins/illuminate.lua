require("illuminate").configure({ delay = 200 })

local bind = vim.keymap.set

bind('n', ']]', function() require("illuminate").goto_next_reference(false) end, {desc = "Next Reference", noremap=true, silent=true, buffer=true})
bind('n', '[[', function() require("illuminate").goto_prev_reference(false) end, {desc = "Previous Reference", noremap=true, silent=true, buffer=true})
