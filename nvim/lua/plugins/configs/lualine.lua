local lualine_catppuccin = require('lualine.themes.catppuccin')
local global_icons = require("global.icons").icons

local my_extension = {
  sections = {
  },
  filetypes = {'NvimTree'}
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = lualine_catppuccin,
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = false,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {},
    lualine_c = {
      {'filename', path = 1},
      {'diff'},
      {
        'diagnostics',
        symbols = {
          hint = global_icons.hint,
          info = global_icons.info,
          warn = global_icons.warning,
          error = global_icons.error,
        },
        update_in_insert = false, -- Update diagnostics in insert mode.
      }
    },
    lualine_x = {'branch', 'progress'},
    lualine_y = {},
    lualine_z = {}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {
    my_extension
  }
}
