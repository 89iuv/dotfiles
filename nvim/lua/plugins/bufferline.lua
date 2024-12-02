return {
  "akinsho/bufferline.nvim",
  dependencies = {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  },
  opts = function(_, opts)
    local colors = require("catppuccin.palettes").get_palette("macchiato")
    opts.options.always_show_bufferline = true
    opts.options.tab_size = 1
    opts.options.offsets = {
      {
        filetype = "neo-tree",
        text = "Explorer",
        highlight = "Normal",
        text_align = "left",
        separator = true,
      },
    }
    opts.options.indicator = {
      icon = "▍",
    }
    opts.options.separator_style = { " ", " " }
    opts.options.themable = true
    opts.highlights = require("catppuccin.groups.integrations.bufferline").get({
      custom = {
        all = {
          indicator_selected = { fg = colors.lavender },

          buffer_selected = { fg = colors.lavender, bg = colors.base }, -- current
          buffer_visible = { fg = colors.subtext0, style = {} },

          offset_separator = { link = "WinSeparator" },

          fill = { bg = colors.mantle },

          modified = { fg = colors.peach },
          modified_visible = { fg = colors.peach },
          modified_selected = { fg = colors.peach },

          trunc_marker = {
            fg = colors.overlay0,
            bg = colors.mantle,
          },
        },
      },
    })
  end,
}
