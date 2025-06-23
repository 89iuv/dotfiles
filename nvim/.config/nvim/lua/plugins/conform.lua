return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      ["markdown"] = { "prettier", "markdown-toc" },
      ["markdown.mdx"] = { "prettier", "markdown-toc" },
    },
    formatters = {
      black = {
        prepend_args = { "--line-length", "119" },
      },
    },
  },
}
