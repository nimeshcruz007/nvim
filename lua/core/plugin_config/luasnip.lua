local ls = require("luasnip")


-- Snippet example for HTML auto-closing tags
ls.add_snippets("html", {
    ls.snippet("tag", {
        ls.text_node("<"), ls.insert_node(1, "div"), ls.text_node(">"),
        ls.insert_node(2),
        ls.text_node("</"), ls.dynamic_node(1, function(args) return { args[1] } end, { 1 }), ls.text_node(">")
    })
})

-- Keybindings for snippet expansion & navigation
vim.keymap.set({ "i", "s" }, "<Tab>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })
