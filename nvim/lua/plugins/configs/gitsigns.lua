require('gitsigns').setup()

local wk = require("which-key")
wk.register({
  ["<leader>"] = {
    g = {
      name = "Git",
      b = {"<cmd>Gitsigns blame_line<cr>", "Blame"},
      s = {"<cmd>Gitsigns select_hunk<cr>", "Select Hunk"},
      v = {"<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk"},
      n = {"<cmd>Gitsigns next_hunk<cr>", "Next Hunk"},
      p = {"<cmd>Gitsigns prev_hunk<cr>", "Previous Hunk"},
      r = {"<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk"},
      c = {"<cmd>Gitsigns diffthis<cr>", "Diff Buffer"},
      d = {"<cmd>Gitsigns reset_buffer<cr>", "Reset Buffer"},
    },
  },
})
