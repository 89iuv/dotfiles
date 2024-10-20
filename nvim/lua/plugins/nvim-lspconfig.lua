return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    opts.servers.bashls = {
      filetypes = { "sh", "zsh" },
    }
  end,
}
