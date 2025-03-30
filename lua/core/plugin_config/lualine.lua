require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'catppuccin',
        always_show_tabline = false
    },
    sections = {
        lualine_a = { { 'mode' } },
        lualine_b = { 'filename' },
        lualine_c = { 'branch', 'diff', 'diagnostics' },
    },
    tabline = {
        lualine_b = {
            {
                'tabs',
                tab_max_length = 40,
                mode = 2,
                use_mode_colors = false,
            },
        },
    }
}
