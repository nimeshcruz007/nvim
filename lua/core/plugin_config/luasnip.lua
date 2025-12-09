local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local sn = ls.snippet_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("javascriptreact, typescriptreact", {
    s("log", fmt("console.log({});", { i(1, "value") })),
})
