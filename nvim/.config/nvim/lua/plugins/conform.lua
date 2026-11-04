return {
  "stevearc/conform.nvim",
  cmd = "ConformInfo",
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = { "n" },
      desc = "Format Buffer",
    },
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = { "x" },
      desc = "Format Range",
    },
  },
  opts = {
    formatters_by_ft = {
      dockerfile = { "dockerfmt" },
      lua = { "stylua" },
      python = { "ruff_format" },
      markdown = { "prettier", "markdownlint-cli2", "markdown-toc" },
      json = { "prettier" },
      jsonc = { "prettier" },
      yaml = { "prettier" },
    },
  },
}
