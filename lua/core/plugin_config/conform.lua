require("conform").setup({
	formatters_by_ft = {
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier", "eslint_d" },
		typescriptreact = { "prettier", "eslint_d" },
		json = { "prettier" },
		html = { "prettier" },
		css = { "prettier" },
		lua = { "stylua" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
	formatters = {
		eslint_d = {
			condition = function(ctx)
				-- Check if an ESLint config file exists in the project
				return vim.fs.find(
					{ ".eslintrc.js", ".eslintrc.json", "eslint.config.js" },
					{ path = ctx.filename, upward = true }
				)[1]
			end,
		},
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
