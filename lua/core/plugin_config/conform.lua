require("conform").setup({
    formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier", "eslint_d" },
        typescriptreact = { "prettier", "eslint_d" },
        json = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
    },
    formatters = {
        eslint_d = {
            command = "eslint_d",
            args = { "--fix-dry-run", "--format", "json", "--stdin", "--stdin-filename", "$FILENAME" },
            condition = function(ctx)
                -- Only run eslint_d if there are ESLint diagnostics
                local diag = vim.diagnostic.get(ctx.bufnr,
                    { namespace = vim.lsp.diagnostic.get_namespace(ctx.client_id) })
                return #diag > 0
            end,
        },
    },
})
