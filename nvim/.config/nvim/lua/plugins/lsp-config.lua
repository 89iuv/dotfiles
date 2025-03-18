return {
  "neovim/nvim-lspconfig",
  opts = {
    diagnostics = {
      -- virtual_text = false,
    },
    capabilities = {
      workspace = {
        didChangeWatchedFiles = {
          dynamicRegistration = true,
        },
      },
    },
  },
}
