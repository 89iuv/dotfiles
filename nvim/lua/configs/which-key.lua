local wk = require("which-key")

wk.register({
  ["<leader>"] = {
    f = {
      name = "+file",
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
    },
    e = {
      name = "+explorer",
      t = { "<cmd>NvimTreeToggle<cr>", "Toggle" },
      f = { "<cmd>NvimTreeFocus<cr>", "Focus" },
    },
    w = {
      name = "+window",
      q = {"<cmd>q<cr>", "Close"},
      s = {"<cmd>sp<cr>", "Split Horizontal"},
      v = {"<cmd>vs<cr>", "split Vertical"},
    },
    b = {
      name = "+buffer",
      q = {"<cmd>Bdelete<cr>", "Close"},
      f = {"<cmd>Telescope buffers<cr>", "Find Buffer"},
    },
    n = {
      name = "+nvim",
      q = {"<cmd>qa<cr>", "Close"},
    }

  },
})
