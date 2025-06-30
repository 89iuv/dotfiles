return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "css",
      "latex",
      "norg",
      "scss",
      "svelte",
      "typst",
      "vue",
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<M-o>",
        node_incremental = "<M-o>",
        node_decremental = "<M-i>",
        scope_incremental = false,
      },
    },
  },
}
