return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  cmd = {
    "MasonToolsInstall",
    "MasonToolsInstallSync",
    "MasonToolsUpdate",
    "MasonToolsUpdateSync",
    "MasonToolsClean",
  },
  event = "VeryLazy",
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
        "prettier",

        -- json
        "json-lsp",
      },
    })
  end,
}
