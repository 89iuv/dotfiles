vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
})

require("nvim-treesitter").install({
  "bash",
  "lua",
  "python",
})

vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo.foldmethod = "expr"
vim.wo.foldlevel = 99
