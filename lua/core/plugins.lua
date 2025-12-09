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
        "github/copilot.vim"
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "nvim-lua/plenary.nvim", branch = "master" },
        },
        build = "make tiktoken",
        opts = {
            -- See Configuration section for options
        },
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
        "hrsh7th/nvim-cmp"
    },
    {
        "hrsh7th/cmp-path"
    },
    {
        "hrsh7th/cmp-nvim-lsp"
    },
    {

        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        "L3MON4D3/LuaSnip",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
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
        "saadparwaiz1/cmp_luasnip"
    },
    {
        "rafamadriz/friendly-snippets"
    },
    {
        "stevearc/conform.nvim"
    },
    {
        "lukas-reineke/indent-blankline.nvim"
    },
    {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    {

        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        requires = { { "nvim-lua/plenary.nvim" } },
    },
    {
        "ThePrimeagen/harpoon"
    },


    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    -- install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
})
