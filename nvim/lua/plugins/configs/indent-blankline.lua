require("indent_blankline").setup {
  filetype_exclude = {'NvimTree', 'help'},
  -- for example, context is off by default, use this to turn it on
  show_current_context = true,
  show_current_context_start = false,
}

local colors = require("catppuccin.palettes").get_palette()
require("catppuccin.lib.highlighter").syntax({
  -- NvimTreeWinSeparator = { fg = colors.mantle, bg = colors.mantle },
  IndentBlanklineContextChar = { fg = colors.surface2 },
})
