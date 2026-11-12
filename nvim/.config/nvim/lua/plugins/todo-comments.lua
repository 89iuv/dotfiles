return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = { "BufReadPre", "BufNewFile" },
  -- stylua: ignore
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
    { "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "Todo (Trouble)" },
    { "<leader>xT", "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
  },
  config = function()
    require("todo-comments").setup({
      signs = true,
      highlight = {
        -- keyword = "wide",
        keyword = "wide_fg",
      },
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
