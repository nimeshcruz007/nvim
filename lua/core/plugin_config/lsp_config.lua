local lspconfig = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local keymap = vim.keymap;

mason_lspconfig.setup({
    ensure_installed = { "lua_ls", "eslint" }
})

-- local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- local on_attach = function(_, _)
-- end

require("mason").setup()
require("mason-lspconfig").setup()


vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
        -- keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
        keymap.set("n", "gi", vim.lsp.buf.implementation, {})
        keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
        keymap.set("n", "K", vim.lsp.buf.hover, {})
        keymap.set("n", "gs", vim.lsp.buf.definition, {})
        keymap.set("n", "gd", vim.diagnostic.goto_next, {})

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>dl", vim.diagnostic.open_float, opts)
    end,
})

mason_lspconfig.setup({
    function(server_name)
        lspconfig[server_name].setup({
            capabilities = capabilities,
        })
    end,

    -- Custom config for lua_ls
    ["lua_ls"] = function()
        require("lspconfig").lua_ls.setup {
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    },
                },
            },
        }
    end,

    -- Custom config for cssls
    ["cssls"] = function()
        require("lspconfig").cssls.setup {
            capabilities = capabilities,
        }
    end,

})
