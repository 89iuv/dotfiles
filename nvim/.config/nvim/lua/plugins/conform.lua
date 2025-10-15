return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      ["markdown"] = { "prettier", "markdown-toc" },
      ["markdown.mdx"] = { "prettier", "markdown-toc" },
    },
    formatters = {
      stylua = {
        prepend_args = {
          "--indent-type",
          "Spaces",
          "--indent-width",
          "2",
        },
      },
      black = {
        prepend_args = {
          "--line-length",
          "120",
        },
      },
      prettier = {
        prepend_args = {
          "--prose-wrap",
          "always",
          "--print-width",
          "80",
        },
      },
    },
  },
}
