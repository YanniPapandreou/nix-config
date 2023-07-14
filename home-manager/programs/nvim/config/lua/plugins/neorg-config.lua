require('neorg').setup({
  load = {
    ["core.defaults"] = {}, -- Loads default behaviour
    ["core.concealer"] = {
      -- config = {
      --   icon_preset = "diamond",
      -- },
    }, -- Adds pretty icons to your documents
    ["core.dirman"] = { -- Manages Neorg workspaces
      config = {
        workspaces = {
          notes = "~/notes/",
          jobs = "~/Documents/Jobs/notes/",
        },
        default_workspace = "notes",
      },
    },
    ["core.summary"] = {},
    ["core.integrations.telescope"] = {},
  },
})


local neorg_callbacks = require("neorg.callbacks")

neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
    -- Map all the below keybinds only when the "norg" mode is active
    keybinds.map_event_to_mode("norg", {
        n = { -- Bind keys in normal mode
            { ",f", "core.integrations.telescope.find_linkable" },
        },

        i = { -- Bind in insert mode
            { "<C-l>", "core.integrations.telescope.insert_link" },
        },
    }, {
        silent = true,
        noremap = true,
    })
end)

