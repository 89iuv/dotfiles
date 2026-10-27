return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    vim.keymap.set("n", "]t", function()
      require("todo-comments").jump_next()
    end, { desc = "Next todo comment" })

    vim.keymap.set("n", "[t", function()
      require("todo-comments").jump_prev()
    end, { desc = "Previous todo comment" })

    require("todo-comments").setup({
      signs = true,
      keywords = {
        -- NOTE: test note
        NOTE = { icon = "󰌵 " },

        -- TODO: test todo
        TODO = { icon = "󰸞 " },

        -- WARN: test warn
        WARN = { icon = "󱈸 " },

        -- HACK: test hack
        HACK = { icon = "󰈸 " },

        -- PERF: test perf
        PERF = { icon = "󰉁 " },

        -- TEST: tst test
        TEST = { icon = "󰙨 " },

        -- FIX: test fix
        FIX = { icon = "󰃤 " },
      },
    })
  end,
}
