local function mini_spec(name, opts)
  return {
    "echasnovski/mini." .. name,
    version = false,
    opts = opts or {}
  }
end

return {
  {
    "echasnovski/mini.starter",
    version = false,
    config = function()
      local starter = require("mini.starter")

      local my_telescope_section = function()
        return function()
          return {
            -- {action = 'Telescope file_browser',    name = 'Browser',         section = 'Telescope'},
            -- {action = 'Telescope command_history', name = 'Command history', section = 'Telescope'},
            { action = 'Telescope find_files', name = 'Files',     section = 'Telescope' },
            { action = 'Telescope help_tags',  name = 'Help tags', section = 'Telescope' },
            { action = 'Telescope live_grep',  name = 'Live grep', section = 'Telescope' },
            { action = 'Telescope oldfiles',   name = 'Old files', section = 'Telescope' },
          }
        end
      end

      local my_lazy_section = function()
        return function()
          return {
            { action = "Lazy", name = "Open UI", section = "Lazy" }
          }
        end
      end

      starter.setup({
        items = {
          starter.sections.sessions(5, true),
          -- starter.sections.telescope(),
          my_telescope_section(),
          my_lazy_section(),
          starter.sections.recent_files(5, true),
          starter.sections.recent_files(5, false),
          starter.sections.builtin_actions(),
        }
      })
    end
  },
  mini_spec("statusline"),
  mini_spec("pairs"),
  mini_spec("cursorword"),
  mini_spec("indentscope"),
  mini_spec("jump"),
  mini_spec("jump2d", {
    mappings = {
      start_jumping = ",<CR>"
    }
  }),
  -- mini_spec("ma"),
  mini_spec("move", {
    mappings = {
      -- Move visual selection in Visual mode.
      left = '<C-h>',
      right = '<C-l>',
      down = '<C-j>',
      up = '<C-k>',

      -- Move current line in Normal mode
      line_left = '<C-h>',
      line_right = '<C-l>',
      line_down = '<C-j>',
      line_up = '<C-k>',
    }
  }),
  mini_spec("surround"),
  mini_spec("trailspace"),
  mini_spec("sessions"),
  mini_spec("bracketed", {
    -- First-level elements are tables describing behavior of a target:
    --
    -- - <suffix> - single character suffix. Used after `[` / `]` in mappings.
    --   For example, with `b` creates `[B`, `[b`, `]b`, `]B` mappings.
    --   Supply empty string `''` to not create mappings.
    --
    -- - <options> - table overriding target options.
    --
    -- See `:h MiniBracketed.config` for more info.

    buffer     = { suffix = 'b', options = {} },
    comment    = { suffix = 'c', options = {} },
    conflict   = { suffix = 'x', options = {} },
    -- diagnostic = { suffix = 'd', options = {} },
    -- file       = { suffix = 'f', options = {} },
    -- indent     = { suffix = 'i', options = {} },
    jump       = { suffix = 'j', options = {} },
    location   = { suffix = 'l', options = {} },
    oldfile    = { suffix = 'o', options = {} },
    quickfix   = { suffix = 'q', options = {} },
    treesitter = { suffix = 'T', options = {} },
    undo       = { suffix = 'u', options = {} },
    window     = { suffix = 'w', options = {} },
    yank       = { suffix = 'y', options = {} },
  }),
}
