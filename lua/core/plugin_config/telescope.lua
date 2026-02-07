-- Setup Telescope
require("telescope").setup({
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
        file_ignore_patterns = { "node_modules" },
    },
})

-- Key mappings for Telescope built-in functions
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fl", builtin.live_grep, {})
vim.keymap.set("n", "<leader>ft", builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Resume Last Search' })
vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, {})
