require("mason").setup({
  ui = {
    -- border = 'single'
  }
})

local wk = require("which-key")
wk.register({
  ["<leader>"] = {
    m = {
      name = "Mason",
      o = { "<cmd>Mason<cr>", "Open Mason Window" },
      h = { "<cmd>vert help mason.nvim<cr>", "Open Documentation" },
    },
  },
})
