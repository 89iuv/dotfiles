return {
  "barreiroleo/ltex-extra.nvim",
  branch = "dev",
  ft = { "markdown" },
  enabled = false,
  opts = {
    load_langs = { "en-US" },
    path = vim.fn.expand("~") .. "/.local/share/ltex",
  },
}
