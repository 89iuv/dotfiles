return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = { "mason-org/mason.nvim" },
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = {
        -- LSP Servers
        "lua-language-server",
        "basedpyright",

        -- Formatters and Linters
        "stylua",
        "ruff",
      },
    })
  end,
}
