local catppuccin = require "catppuccin"
catppuccin.setup {
	flavour = "mocha",
	-- flavour = "macchiato",
	-- flavour = "frappe",
	-- flavour = "latte",
	transparent_background = false,
	integrations = {
		which_key = true,
	},
}

catppuccin.compile()
vim.cmd.colorscheme "catppuccin"

local colors = require("catppuccin.palettes").get_palette()
require("catppuccin.lib.highlighter").syntax {
	FloatBorder = { fg = colors.overlay2, bg = colors.mantle },
}
