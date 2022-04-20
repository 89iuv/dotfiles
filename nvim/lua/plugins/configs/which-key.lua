local wk = require("which-key")

wk.register({
  ["<leader>"] = {
    f = {
      name = "+file",
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      w = { "<cmd>Telescope live_grep<cr>", "Find Word" },
      r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
    },
    e = {
      name = "+explorer",
      t = { "<cmd>NvimTreeToggle<cr>", "Toggle" },
      f = { "<cmd>NvimTreeFocus<cr>", "Focus" },
      r = { "<cmd>NvimTreeRefresh<cr>", "Refersh" },
    },
    w = {
      name = "+window",
      q = {"<cmd>q<cr>", "Close"},
      h = {"<cmd>sp<cr>", "Split Horizontal"},
      v = {"<cmd>vs<cr>", "split Vertical"},
    },
    b = {
      name = "+buffer",
      q = {"<cmd>Bdelete<cr>", "Close"},
      f = {"<cmd>Telescope buffers<cr>", "Find Buffer"},
      n = {"<cmd>BufferLineMoveNext<cr>", "Move Buffer to Next"},
      p = {"<cmd>BufferLineMovePrev<cr>", "Move Buffer to Previous"},
      r = {"<cmd>BufferLineCloseRight<cr>", "Close Buffers to the Right"},
      l = {"<cmd>BufferLineCloseLeft<cr>", "Close Buffers to the Left"},
    },
    g = {
      name = "+git",
      b = {"<cmd>Gitsigns blame_line<cr>", "Blame"},
      s = {"<cmd>Gitsigns select_hunk<cr>", "Select Hunk"},
      v = {"<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk"},
      n = {"<cmd>Gitsigns next_hunk<cr>", "Next Hunk"},
      p = {"<cmd>Gitsigns prev_hunk<cr>", "Previous Hunk"},
      r = {"<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk"},
      c = {"<cmd>Gitsigns diffthis<cr>", "Diff Buffer"},
      d = {"<cmd>Gitsigns reset_buffer<cr>", "Reset Buffer"},
    },
    n = {
      name = "+nvim",
      q = {"<cmd>qa<cr>", "Close"},
    },
  },

  ["<leader>/"] = {"<cmd>CommentToggle<cr>", "Comment Toggle" },

})
