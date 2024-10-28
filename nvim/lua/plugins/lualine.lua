return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  },
  init = function()
    vim.g.trouble_lualine = false
    vim.opt.pumblend = 0 -- disable cmp menu transparency
  end,
  opts = function(_, opts)
    local macchiato = require("catppuccin.palettes").get_palette("macchiato")
    local lualine_catppuccin = require("catppuccin.utils.lualine")()

    lualine_catppuccin.normal.c.bg = macchiato.crust
    lualine_catppuccin.inactive.c.bg = macchiato.crust

    opts.options.theme = lualine_catppuccin
    opts.options.component_separators = { left = "│", right = "│" }
    opts.options.section_separators = { left = "▌", right = "▐" }
  end,
}
