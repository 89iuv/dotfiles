return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  cmd = {
    "MasonToolsInstall",
    "MasonToolsInstallSync",
    "MasonToolsUpdate",
    "MasonToolsUpdateSync",
    "MasonToolsClean",
  },
  lazy = false, -- this needs to run at startup in order to auto install packages
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = {
        -- formatters
        "prettier",

        -- bash
        "bash-language-server",
        "shellcheck",
        "shfmt",

        -- docker
        "dockerfile-language-server",
        "hadolint",
        "dockerfmt",

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

        -- json
        "json-lsp",

        -- toml
        "taplo",

        -- yaml
        "yaml-language-server",
        "yamllint",
      },
    })
  end,
}
