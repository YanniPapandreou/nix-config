-- Neodev setup
require('neodev').setup({})

-- Setup lspconfig.
local nvim_lsp = require('lspconfig')
-- Setup Lspsaga
local lspsaga = require("lspsaga")
lspsaga.setup({
  ui = {
    border = "rounded",
  }
})
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- -- Enable completion triggered by <c-x><c-o>
    -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true, buffer=true }
    require('legendary').keymaps({
        { 'gD', vim.lsp.buf.declaration, description = 'LSP: Go to declaration', opts = opts },
        { 'gd', '<cmd>Lspsaga goto_definition<cr>', description = 'LSP: Go to definition', opts = opts },
        { 'gh', '<cmd>Lspsaga lsp_finder<cr>', description = 'LSP: Go Hunt', opts = opts },
        { 'gp', '<cmd>Lspsaga peek_definition<cr>', description = 'LSP: Go Peek Definition', opts = opts },
        { 'K', "<cmd>Lspsaga hover_doc<cr>", description = 'LSP: Hover', opts = opts },
        { '<leader>K', "<cmd>Lspsaga hover_doc ++keep<cr>", description = 'LSP: Hover (Keep)', opts = opts },
        { 'gi', vim.lsp.buf.implementation, description = 'LSP: Go to implementation', opts = opts },
        { '<leader>cs', vim.lsp.buf.signature_help, description = 'LSP: Signature help', mode = { 'n', 'i' }, opts = opts },
        { '<leader>wa', vim.lsp.buf.add_workspace_folder, description = 'LSP: Add workspace folder', opts = opts },
        { '<leader>wr', vim.lsp.buf.remove_workspace_folder, description = 'LSP: Remove workspace folder', opts = opts },
        { '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, description = 'LSP: List workspaces', opts = opts },
        { '<leader>D', vim.lsp.buf.type_definition, description = 'LSP: Show type definition', opts = opts },
        { '<F2>', "<cmd>Lspsaga rename<cr>", description = 'LSP: Rename', opts = opts },
        { '<leader>ca', "<cmd>Lspsaga code_action<cr>", description = 'LSP: Code Action', opts = opts },
        { '<leader>co', "<cmd>Lspsaga outline<cr>", description = 'LSP: Outline', opts = opts },
        { '<leader>cb', "<cmd>Lspsaga show_buf_diagnostics<cr>", description = 'LSP: Show Buffer Diagnostics', opts = opts },
        { 'gr', vim.lsp.buf.references, description = 'LSP: Show references', opts = opts },
        { 'gl', "<cmd>Lspsaga show_line_diagnostics<cr>", description = 'LSP: Show Line Diagnostics', opts = opts },
        { '<leader>e', function() vim.diagnostic.open_float(0, {scope="line"}) end, description = 'Diagnostics: Show window', opts = opts },
        { '[d', function() vim.diagnostic.goto_prev({ float =  { border = "single" }}) end, description = 'Diagnostics: Previous', opts = opts },
        { ']d', function() vim.diagnostic.goto_next({ float =  { border = "single" }}) end, description = 'Diagnostics: Next', opts = opts },
        { '<leader>q', vim.diagnostic.setloclist, description = 'Diagnostic: Show location list', opts = opts },
        { '<leader>f', vim.lsp.buf.formatting, description = 'LSP: Format file', opts = opts },
    })

    -- if client.server_capabilities.document_formatting then
    --     vim.cmd([[
    --         augroup LspFormatting
    --             autocmd! * <buffer>
    --             autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
    --         augroup END
    --         ]])
    -- end
end

-- local notify = require('notify')
-- vim.lsp.handlers['window/showMessage'] = function(_, result, ctx)
--   local client = vim.lsp.get_client_by_id(ctx.client_id)
--   local lvl = ({ 'ERROR', 'WARN', 'INFO', 'DEBUG' })[result.type]
--   notify({ result.message }, lvl, {
--     title = 'LSP | ' .. client.name,
--     timeout = 10000,
--     keep = function()
--       return lvl == 'ERROR' or lvl == 'WARN'
--     end,
--   })
-- end

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Enable Language Servers
local function default_lsp_setup(module)
    nvim_lsp[module].setup{
        on_attach = on_attach,
        capabilities = capabilities
    }
end
-- Bash
default_lsp_setup('bashls')

-- LaTeX
default_lsp_setup('texlab')

-- -- Haskell
-- default_lsp_setup('hls')

-- Lua
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
nvim_lsp.lua_ls.setup{
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path,
            },
            completion = {
                callSnippet = 'Replace'
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            }
        }
    },
    on_attach = on_attach,
    capabilities = capabilities
}

-- Nix
nvim_lsp.rnix.setup{
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)

        -- Let statix format
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
    end
}

-- Python
default_lsp_setup('pyright')

-- -- CSS
-- default_lsp_setup('cssls')
-- -- HTML
-- default_lsp_setup('html')
-- -- JSON
-- default_lsp_setup('jsonls')

-- NULL
require("null-ls").setup({
    sources = {
        -- Nix
        require("null-ls").builtins.formatting.nixpkgs_fmt,
        require("null-ls").builtins.diagnostics.statix,
        require("null-ls").builtins.code_actions.statix,

        -- Python
        require("null-ls").builtins.formatting.black
    },
})
