local catppuccin = require'catppuccin'
catppuccin.setup({
  flavour = "mocha",
  -- flavour = "macchiato",
  transparent_background = false,
  dim_inactive = {
    enabled = false,
    shade = "dark",
    percentage = 0.20,
  },
  integrations = {
    which_key = true,
  }
})

vim.cmd[[colorscheme catppuccin]]
