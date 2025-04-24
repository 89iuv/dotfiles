return {
  "mfussenegger/nvim-jdtls",
  opts = {
    jdtls = {
      capabilities =
        LazyVim.has("blink.cmp") and require("blink.cmp").get_lsp_capabilities()
        or LazyVim.has( "cmp-nvim-lsp") and require("cmp_nvim_lsp").default_capabilities()
        or nil,
    },
  },
}
