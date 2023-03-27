local catppuccin = require 'catppuccin'
catppuccin.setup({
  flavour = "mocha",
  -- flavour = "macchiato",
  -- flavour = "frappe",
  -- flavour = "latte",
  transparent_background = false,
  integrations = {
    which_key = true,
  }
})

vim.cmd.colorscheme "catppuccin"
