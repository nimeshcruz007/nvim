-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- save buffer
keymap.set("n", "<leader>w", ":w<Return>", opts)

-- Increment / Decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- New Tab
keymap.set("n", "te", ":tabedit<Return>", opts)

-- Split Window
keymap.set("n", "sb", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

--Move Window
keymap.set("n", "sh", "<C-w>h", opts)
keymap.set("n", "sk", "<C-w>k", opts)
keymap.set("n", "sl", "<C-w>l", opts)
keymap.set("n", "sj", "<C-w>j", opts)
