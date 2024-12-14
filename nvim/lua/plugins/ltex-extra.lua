return {
  "barreiroleo/ltex_extra.nvim",
  branch = "dev",
  ft = { "markdown", "tex" },
  dependencies = { "neovim/nvim-lspconfig" },
  -- yes, you can use the opts field, just I'm showing the setup explicitly
  opts = {
    path = ".ltex",
  },
}
