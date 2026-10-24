return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install {
      "bash",
      "diff",

      "xml",
      "json",
      "yaml",
      "toml",

      "markdown",
      "markdown_inline",
    }

    vim.wo.foldmethod = 'expr'
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

    vim.opt.foldlevel = 99
    vim.opt.foldlevelstart = 99

  end
}
