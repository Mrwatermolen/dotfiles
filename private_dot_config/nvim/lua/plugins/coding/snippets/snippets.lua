-- TDOO(franzero): Add C, CPP: Header #ifndef
return {
  {
    "L3MON4D3/LuaSnip",
    config = function()
      local ls = require("luasnip")
      -- some shorthands...
      local s = ls.snippet
      local sn = ls.snippet_node
      local t = ls.text_node
      local i = ls.insert_node
      local c = ls.choice_node
      local r = ls.restore_node
      -- Add snippet by lua
      ls.snippets = {
        -- When trying to expand a snippet, luasnip first searches the tables for
        -- each filetype specified in 'filetype' followed by 'all'.
        -- If ie. the filetype is 'lua.c'
        --     - luasnip.lua
        --     - luasnip.c
        --     - luasnip.all
        -- are searched in that order.
        --
        all = {
          s("tttt", t({ "testttt" })),
          --  trying is class
          s("class", {
            -- Choice: Switch between two different Nodes, first parameter is its position, second a list of nodes.
            c(1, {
              t("public "),
              t("private "),
            }),
            t("class "),
            i(2),
            t(" "),
            c(3, {
              t("{"),
              -- sn: Nested Snippet. Instead of a trigger, it has a position, just like insert-nodes. !!! These don't expect a 0-node!!!!
              -- Inside Choices, Nodes don't need a position as the choice node is the one being jumped to.
              sn(nil, {
                t("extends "),
                -- restoreNode: stores and restores nodes.
                -- pass position, store-key and nodes.
                r(1, "other_class", i(1)),
                t(" {"),
              }),
              sn(nil, {
                t("implements "),
                -- no need to define the nodes for a given key a second time.
                r(1, "other_class"),
                t(" {"),
              }),
            }),
            t({ "", "\t" }),
            i(0),
            t({ "", "}" }),
          }),
        },
      }
      -- To use existing VS Code style snippets
      -- load snippets from path/of/your/nvim/config/my-cool-snippets
      -- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
      -- in a cpp file: search c-snippets, then all-snippets only (no cpp-snippets!!).
      ls.filetype_set("cpp", { "c" })
    end,
  },
}
