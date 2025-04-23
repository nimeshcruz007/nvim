require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "eslint" }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(_, _)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    vim.keymap.set('n', 'gs', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gd', vim.diagnostic.goto_prev, {})
end

require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers {
    function(server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup({
            on_attach = on_attach,
        })
    end,

    ["lua_ls"] = function()
        local lspconfig = require("lspconfig")
        lspconfig.lua_ls.setup {
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }
        }
    end,

    ["cssls"] = function()
        local lspconfig = require("lspconfig")
        lspconfig.cssls.setup {
            -- on_attach = on_attach,
            capabilities = capabilities,
            -- settings = {
            --     css = {
            --         validate = true,
            --     },
            --     scss = {
            --         validate = true,
            --     },
            --     less = {
            --         validate = true,
            --     },
            -- }
        }
    end,
}
