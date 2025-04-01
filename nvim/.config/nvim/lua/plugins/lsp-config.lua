return {
  "neovim/nvim-lspconfig",
  opts = function (_, opts)
    -- opts.diagnostics.virtual_text = false
    opts.capabilities = {
      workspace = {
        didChangeWatchedFiles = {
          dynamicRegistration = true,
        },
      },
    }

    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "K", false }
    keys[#keys + 1] = { "gk", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover" }
  end
}
