return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = { "<c-k>", false, mode = "i" }

    local new_opts = {
      diagnostics = {
        float = {
          border = "single",
        },
      },
    }

    return vim.tbl_deep_extend("force", opts, new_opts)

  end,
}
