return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "williamboman/mason.nvim",
  },
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
    highlight = {
      -- disable highlight for checkhealth as it does not show colors for ok, warning, error
      disable = function(_, bufnr)
        return vim.bo[bufnr].filetype == "checkhealth"
      end,
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
