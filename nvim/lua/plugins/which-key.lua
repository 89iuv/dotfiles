return {
  "folke/which-key.nvim",
  opts = {
    preset = "modern",
    spec = {
      { "<space>i", desc = "Decrement Selection", mode = "x" },
      { "<space>o", desc = "Increment Selection", mode = { "x", "n" } },
    },
  },
}
