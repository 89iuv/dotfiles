return {
  "gbprod/yanky.nvim",
  keys = {
    { "<LeftRelease>", "<Plug>(YankyYank)", mode = { "v" }, desc = "Yank on mouse select" },
    { "<2-LeftRelease>", "<Plug>(YankyYank)", mode = { "v" }, desc = "Yank on word mouse select" },
  },
  opts = {
    ring = {
      permanent_wrapper = require("yanky.wrappers").remove_carriage_return,
    },
    highlight = {
      timer = 250,
    },
  },
}
