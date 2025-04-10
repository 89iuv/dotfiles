return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters = {
      black = {
        prepend_args = { "--line-length", "119" },
      },
    },
  },
}
