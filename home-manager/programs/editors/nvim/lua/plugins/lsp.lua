return {
  -- LSP plugins
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = true },
  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Useful status updates for LSP.
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- Allows extra capabilities provided by nvim-cmp
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-t>.
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- Find references for the word under your cursor.
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

          -- Fuzzy find all the symbols in your current workspace.
          --  Similar to document symbols, except searches over your entire project.
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          -- Rename the variable under your cursor.
          --  Most Language Servers support renaming across files, etc.
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          map('<leader>td', function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end,
            'Lsp: [T]oggle Inline Diagnostics')

          local virtual_text_enabled = false
          local ToggleVirtualText = function()
            virtual_text_enabled = not virtual_text_enabled
            vim.diagnostic.config({
              virtual_text = virtual_text_enabled
            })
          end

          map('<leader>tv', ToggleVirtualText, 'Lsp: [T]oggle [V]irtual Text')

          vim.diagnostic.config({
            virtual_text = virtual_text_enabled,
            signs = {
              text = {
                [vim.diagnostic.severity.ERROR] = ' ',
                [vim.diagnostic.severity.WARN] = ' ',
                [vim.diagnostic.severity.HINT] = ' ',
                [vim.diagnostic.severity.INFO] = ' '
              }
            },
            underline = true,
            update_in_insert = false,
            severity_sort = true,
          })

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          -- The following code creates a keymap to toggle inlay hints in your
          -- code, if the language server you are using supports them
          --
          -- This may be unwanted, since they displace some of your code
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      -- Change diagnostic symbols in the sign column (gutter)
      -- if vim.g.have_nerd_font then
      --   local signs = { Error = '', Warn = '', Hint = '', Info = '' }
      --   for type, icon in pairs(signs) do
      --     local hl = 'DiagnosticSign' .. type
      --     vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      --   end
      -- end

      -- local capabilities = vim.lsp.protocol.make_client_capabilities()
      -- capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
      -- local setup_server = function(server_name)
      --   local server = servers[server_name] or {}
      --   -- This handles overriding only values explicitly passed
      --   -- by the server configuration above. Useful when disabling
      --   -- certain features of an LSP (for example, turning off formatting for ts_ls)
      --   server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
      --   require('lspconfig')[server_name].setup(server)
      -- end

      require('lspconfig').bashls.setup {}
      require('lspconfig').hls.setup {}
      require('lspconfig').julials.setup {}
      require('lspconfig').markdown_oxide.setup {}
      require('lspconfig').nil_ls.setup {}
      require('lspconfig').pyright.setup {}
      require('lspconfig').ruff.setup {}
      require('lspconfig').texlab.setup {}
      require('lspconfig').r_language_server.setup {}
      require('lspconfig').rust_analyzer.setup {}

      -- require'lspconfig'.rust_analyzer.setup{
      --   settings = {
      --     ['rust-analyzer'] = {
      --       diagnostics = {
      --         enable = false;
      --       }
      --     }
      --   }
      -- }

      require('lspconfig').lua_ls.setup {
        -- cmd = {...},
        -- filetypes = { ...},
        -- capabilities = {},
        on_init = function(client)
          if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
              return
            end
          end

          client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
              -- Tell the language server which version of Lua you're using
              -- (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT'
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME
                -- Depending on the usage, you might want to add additional paths here.
                -- "${3rd}/luv/library"
                -- "${3rd}/busted/library",
              }
              -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
              -- library = vim.api.nvim_get_runtime_file("", true)
            }
          })
        end,
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
            -- diagnostics = { disable = { 'missing-fields' } },
          },
        },
      }
    end,
  },
  {
    'nvimdev/lspsaga.nvim',
    config = function()
      require('lspsaga').setup({})
      vim.keymap.set("n", "<leader>cl", "<cmd>Lspsaga show_line_diagnostics<cr>",
        { desc = "Lspsaga: show line diagnostics" })
    end,
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional
    }
  },
  { -- Autoformat
    -- TODO: configure this
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>cf',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        local lsp_format_opt
        if disable_filetypes[vim.bo[bufnr].filetype] then
          lsp_format_opt = 'never'
        else
          lsp_format_opt = 'fallback'
        end
        return {
          timeout_ms = 500,
          lsp_format = lsp_format_opt,
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          -- {
          --   'rafamadriz/friendly-snippets',
          --   config = function()
          --     require('luasnip.loaders.from_vscode').lazy_load()
          --   end,
          -- },
        },
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds other completion capabilities.
      --  nvim-cmp does not ship with all sources by default. They are split
      --  into multiple repos for maintenance purposes.
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      -- See `:help cmp`
      local cmp = require 'cmp'
      local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      require('luasnip.loaders.from_vscode').lazy_load()
      -- load custom snippets
      require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/snippets" } })
      -- link quarto and rmarkdown to markdown snippets
      luasnip.filetype_extend('quarto', { 'markdown' })
      luasnip.filetype_extend('rmarkdown', { 'markdown' })

      cmp.setup {
        preselect = nil,
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },

        -- For an understanding of why these mappings were
        -- chosen, you will need to read `:help ins-completion`
        --
        -- -- No, but seriously. Please read `:help ins-completion`, it is really good!
        -- mapping = cmp.mapping.preset.insert {
        --   -- Select the [n]ext item
        --   ['<C-n>'] = cmp.mapping.select_next_item(),
        --   -- Select the [p]revious item
        --   ['<C-p>'] = cmp.mapping.select_prev_item(),
        --
        --   -- Scroll the documentation window [b]ack / [f]orward
        --   ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        --   ['<C-f>'] = cmp.mapping.scroll_docs(4),
        --
        --   -- Accept ([y]es) the completion.
        --   --  This will auto-import if your LSP supports it.
        --   --  This will expand snippets if the LSP sent a snippet.
        --   ['<C-y>'] = cmp.mapping.confirm { select = true },
        --
        --   -- If you prefer more traditional completion keymaps,
        --   -- you can uncomment the following lines
        --   --['<CR>'] = cmp.mapping.confirm { select = true },
        --   --['<Tab>'] = cmp.mapping.select_next_item(),
        --   --['<S-Tab>'] = cmp.mapping.select_prev_item(),
        --
        --   -- Manually trigger a completion from nvim-cmp.
        --   --  Generally you don't need this, because nvim-cmp will display
        --   --  completions whenever it has completion options available.
        --   ['<C-Space>'] = cmp.mapping.complete {},
        --
        --   -- Think of <c-l> as moving to the right of your snippet expansion.
        --   --  So if you have a snippet that's like:
        --   --  function $name($args)
        --   --    $body
        --   --  end
        --   --
        --   -- <c-l> will move you to the right of each of the expansion locations.
        --   -- <c-h> is similar, except moving you backwards.
        --   ['<C-l>'] = cmp.mapping(function()
        --     if luasnip.expand_or_locally_jumpable() then
        --       luasnip.expand_or_jump()
        --     end
        --   end, { 'i', 's' }),
        --   ['<C-h>'] = cmp.mapping(function()
        --     if luasnip.locally_jumpable(-1) then
        --       luasnip.jump(-1)
        --     end
        --   end, { 'i', 's' }),
        --
        --   -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        --   --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
        -- },
        mapping = {
          ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
          ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
          ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
          ["<Up>"] = cmp.mapping.select_prev_item(cmp_select_opts),
          ["<Down>"] = cmp.mapping.select_next_item(cmp_select_opts),
          -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
          ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          }),
          -- `Enter` key to confirm completion
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ["<C-h>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<C-l>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            local col = vim.fn.col('.') - 1
            if cmp.visible() then
              cmp.select_next_item(cmp_select_opts)
            elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
              fallback()
            else
              cmp.complete()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item(cmp_select_opts)
            else
              fallback()
            end
          end, { "i", "s" })
        },
        sources = {
          {
            name = 'lazydev',
            -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
            group_index = 0,
          },
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
          { name = 'buffer',  keyword_length = 3 }
          -- TODO: nvim_lsp_signature_help
        },
        experimental = {
          ghost_text = true,
        }
      }
    end,
  },
}
