local lualine_catppuccin = require('lualine.themes.catppuccin')

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = lualine_catppuccin,
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = false,
    globalstatus = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {},
    lualine_c = {{'filename', path = 1}, {'diff'}, {'diagnostics'}},
    lualine_x = {'branch', 'location', 'progress'},
    lualine_y = {},
    lualine_z = {}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{'filename', path = 1}},
    lualine_x = {'progress'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
