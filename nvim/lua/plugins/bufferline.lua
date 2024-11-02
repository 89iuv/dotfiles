return {
  "akinsho/bufferline.nvim",
  dependencies = {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  },
  opts = function(_, opts)
    local colors = require("catppuccin.palettes").get_palette("macchiato")
    opts.options.offsets = {
      {
        filetype = "neo-tree",
        text = "File Explorer",
        highlight = "Normal",
        text_align = "left",
        separator = true,
      },
    }
    opts.options.indicator = {
      icon = "▎",
    }
    opts.options.separator_style = { "▏", "▕" }
    opts.options.themable = true
    opts.highlights = require("catppuccin.groups.integrations.bufferline").get({
      custom = {
        all = {
          indicator_selected = { fg = colors.mauve },
          indicator_visible = { fg = colors.mantle, bg = colors.mantle },

          buffer_selected = { fg = colors.lavender, bg = colors.overlay_0 }, -- current
          buffer_visible = { fg = colors.lavender, style = { "bold", "italic" } },

          offset_separator = { link = "WinSeparator" },

          modified = { fg = colors.peach },
          modified_visible = { fg = colors.peach },
          modified_selected = { fg = colors.peach },

          trunc_marker = {
            fg = colors.overlay_0,
            bg = colors.mantle,
          },
        },
      },
    })
  end,
}
