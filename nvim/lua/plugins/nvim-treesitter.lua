return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "robot",
      "mermaid",
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<space>o",
        node_incremental = "<space>o",
        scope_incremental = false,
        node_decremental = "<space>i",
      },
    },
  },
}
