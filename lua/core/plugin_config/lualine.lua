require('lualine').setup {
    options = {
        icons_enabled = true,
        always_show_tabline = true,
        theme = 'auto', -- This will automatically pick colors based on your colorscheme
        component_separators = '',
        section_separators = '',
    },
    sections = {
        lualine_a = { { 'mode' } },
        lualine_b = { 'filename' },
        lualine_c = { 'branch', 'diff', 'diagnostics' },
        lualine_x = { 'filetype' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {
        lualine_a = {
            {
                'tabs',
                mode = 2,
                max_length = vim.o.columns,
                use_mode_colors = true,              -- Use theme colors for active/inactive tabs
                tabs_color = {
                    active = 'lualine_a_normal',     -- Bright color for active tab
                    inactive = 'lualine_c_inactive', -- Dim color for inactive tabs
                },
                fmt = function(name, context)
                    local filename = vim.fn.fnamemodify(name, ':t')
                    if filename == '' then
                        return '[Add New File]'
                    end
                    return filename
                end,
            }
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    }
}
