local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"



-- Setup lazy.nvim
require("lazy").setup({
    {
        "rebelot/kanagawa.nvim"
    },
    {
        "nvim-tree/nvim-tree.lua"
    },
    {
        "nvim-tree/nvim-web-devicons"
    },
    {
        "nvim-lualine/lualine.nvim"
    },
    {
        "nvim-treesitter/nvim-treesitter"
    },
    {
        "tpope/vim-surround"
    },
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },

        version = '1.*',

        opts = {
            keymap = { preset = 'default' },

            appearance = {
                nerd_font_variant = 'mono'
            },

            completion = { documentation = { auto_show = true } },

            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },

            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true
    },
    {
        "windwp/nvim-ts-autotag",

        ft = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact"
        },
        config = function()
            require("nvim-ts-autotag").setup()
        end
    },
    {
        "stevearc/conform.nvim"
    },
    {
        "lukas-reineke/indent-blankline.nvim"
    },
    {
        "neovim/nvim-lspconfig",
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason.nvim" },
        config = function()
            require("mason-lspconfig").setup()
            -- require("mason-lspconfig").setup_handlers({})
        end
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        requires = { { "nvim-lua/plenary.nvim" } },
    },
    {
        "ThePrimeagen/harpoon"
    },


    checker = { enabled = true },
})
