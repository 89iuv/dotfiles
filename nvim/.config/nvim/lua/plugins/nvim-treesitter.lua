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

      "html",
      "javascript",
      "typescript"
    }
  end
}
