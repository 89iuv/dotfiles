return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
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
  },
}
