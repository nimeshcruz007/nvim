-- local harpoon = require("harpoon");
local harpoon_mark = require("harpoon.mark");
local harpoon_ui = require("harpoon.ui");

vim.keymap.set("n", "<leader>af", harpoon_mark.add_file, {});
vim.keymap.set("n", "<leader>aa", harpoon_ui.toggle_quick_menu, {});
vim.keymap.set("n", "<leader>an", harpoon_ui.nav_next, {});
vim.keymap.set("n", "<leader>ap", harpoon_ui.nav_prev, {});
