return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({
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
      "typescript",
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
