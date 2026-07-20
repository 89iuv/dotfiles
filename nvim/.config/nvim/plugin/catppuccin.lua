vim.pack.add({
  { src = "https://github.com/catppuccin/nvim" },
})

vim.api.nvim_create_autocmd("UIEnter", {
  once = true,
  callback = function()
    vim.cmd.colorscheme "catppuccin-macchiato"
  end,
})
