require('kanagawa').setup({
    colors = {
        theme = {
            wave = {
                diag = {
                    error = "#C34043", -- Red for errors
                },
            },
        },
    },
})

vim.cmd("colorscheme kanagawa")
