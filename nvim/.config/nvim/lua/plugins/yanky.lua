return {
  "gbprod/yanky.nvim",
  opts = {
    ring = {
      permanent_wrapper = require("yanky.wrappers").remove_carriage_return,
    },
  },
}

