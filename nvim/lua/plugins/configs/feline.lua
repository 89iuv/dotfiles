local ctp_feline = require('catppuccin.groups.integrations.feline')
ctp_feline.setup({
    assets = {
      left_separator = "",
      -- right_separator = "",
      -- left_separator = "",
      right_separator = "",
      -- left_separator = "",
      -- right_separator = "",
      -- left_separator = "",
      -- right_separator = "",
      mode_icon = ""
  },
})

local colors = require("catppuccin.palettes").get_palette()
require("catppuccin.lib.highlighter").syntax({
  -- StatusLine = { bg = colors.base },
  -- StatusLineNC = { bg = colors.base },
})

local	components = ctp_feline.get()
-- components.inactive[1][1] = {
-- 		hl = {
-- 			fg = colors.crust,
-- 			bg = colors.base,
--       style = "underline"
-- 		},
-- 	}
-- print(vim.inspect(components))

require("feline").setup({
	components = components,
  -- disable = {
  --   filetypes = {
  --       '^NvimTree$',
  --   },
  --   buftypes = {},
  --   bufnames = {}
  -- }
})
