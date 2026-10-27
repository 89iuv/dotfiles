return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  dependencies = { "mason-org/mason.nvim" },
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = {
        -- lua
        "lua-language-server",
        "stylua",

        -- python
        "basedpyright",
        "ruff",

        -- markdown
        "marksman",
        "markdownlint-cli2",
        "markdown-toc",
        "prettier"

      },
    })
  end,
}
