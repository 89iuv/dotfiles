return {
  "mfussenegger/nvim-jdtls",
  opts = {
    settings = {
      java = {
        inlayHints = {
          parameterNames = {
            enabled = "all",
          },
        },
        signatureHelp = {
          enabled = true,
        },
      },
    },
  },
}
