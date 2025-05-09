local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()


return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use("rebelot/kanagawa.nvim")
    use("nvim-tree/nvim-tree.lua")
    use("nvim-tree/nvim-web-devicons")
    use("nvim-lualine/lualine.nvim")
    use("nvim-treesitter/nvim-treesitter")
    use("tpope/vim-surround")
    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
    })
    --completion
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-nvim-lsp")
    use({
        "L3MON4D3/LuaSnip",
        requires = { "rafamadriz/friendly-snippets" },         -- Optional: Predefined snippets
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load() -- Load VS Code-style snippets
        end
    })
    use({
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
    })
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")
    use("stevearc/conform.nvim")
    use("lukas-reineke/indent-blankline.nvim")

    use({
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    })
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.4",
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    use({
        "akinsho/toggleterm.nvim",
        tag = "*",
        config = function()
            require("toggleterm").setup()
        end,
    })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)
