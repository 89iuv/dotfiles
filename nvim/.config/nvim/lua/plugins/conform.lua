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
  config = function()
    local languages = require("config.global").languages

    local formatters_by_ft = {}
    for _, plugins in pairs(languages) do
      local conform = plugins.conform ~= nil and plugins.conform or {}
      formatters_by_ft = vim.tbl_deep_extend("force", formatters_by_ft, conform)
    end

    require("conform").setup({
      formatters_by_ft = formatters_by_ft,
    })
  end,
}
