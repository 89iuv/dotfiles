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
      },
    }
    opts.options.themable = true
    opts.highlights = require("catppuccin.groups.integrations.bufferline").get({
      custom = {
        all = {
          indicator_selected = { fg = colors.lavender },
          indicator_visible = { fg = colors.mantle, bg = colors.mantle },

          buffer_selected = { fg = colors.lavender, bg = colors.overlay_0 }, -- current

          modified = { fg = colors.lavender },
          modified_visible = { fg = colors.lavender },
          modified_selected = { fg = colors.lavender },
        },
      },
    })
  end,
}
