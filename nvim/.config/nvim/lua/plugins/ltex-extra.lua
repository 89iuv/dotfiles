return {
  "barreiroleo/ltex-extra.nvim",
  branch = "dev",
  ft = { "markdown" },
  opts = {
    load_langs = { "en-US" },
    path = vim.fn.expand("~") .. "/.local/share/ltex",
  },
}
