return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      term_colors = true,

      integrations = {
        lualine = {
          all = function(colors)
            return {
              normal = {
                c = { bg = colors.crust },
              }
            }
          end,
        },
      },

      custom_highlights = function(colors)
        local colors_utils = require("catppuccin.utils.colors")

        return {
          -- catppuccin
          FloatBorder = { fg = colors.lavender, bg = colors.mantle },
          FloatTitle = { fg = colors.lavender, bg = colors.mantle },

          WinSeparator = { fg = colors.surface0, bg = colors.base },
          StatusLine = { bg = colors.crust },

          Folded = { fg = colors.overlay0, bg = colors.surface0, style = { "italic" } },
          LspInlayHint = { fg = colors.overlay0, bg = "NONE", style = { "italic" } },

          LineNr = { fg = colors.overlay0 },

          -- neotree
          NeoTreeWinSeparator = { fg = colors.surface0, bg = colors.mantle },

          NeoTreeDotfile = { fg = colors.overlay0 },
          NeoTreeProjectName = { fg = colors.blue },
          NeoTreeProjectPath = { link = "NeoTreeDotfile" },

          -- barbar
          BufferOffset = { fg = colors.lavender, bg = colors.mantle },
          BufferScrollArrow = { fg = colors.surface2, bg = colors.mantle },
          BufferTabpageFill = { fg = colors.crust, bg = colors.mantle },

          -- barbar current
          BufferCurrent = { bg = colors.base, fg = colors.lavender, style = { "bold" } },
          BufferCurrentMod = { bg = colors.base, fg = colors.lavender, style = { "bold" } },
          BufferCurrentModBtn = { bg = colors.base, fg = colors.peach },
          BufferCurrentBtn = { bg = colors.base, fg = colors.red },
          BufferCurrentSign = { bg = colors.mantle, fg = colors.surface0 },
          BufferCurrentSignRight = { bg = colors.mantle, fg = colors.surface0 },

          -- barbar visible
          BufferVisible = { bg = colors.mantle, fg = colors.text },
          BufferVisibleMod = { bg = colors.mantle, fg = colors.text},
          BufferVisibleModBtn = { bg = colors.mantle, fg = colors.peach },
          BufferVisibleBtn = { bg = colors.mantle, fg = colors.text },
          BufferVisibleSign = { bg = colors.mantle, fg = colors.surface0 },
          BufferVisibleSignRight = { bg = colors.mantle, fg = colors.surface0 },

          BufferVisibleError = { bg = colors.base, fg = colors.red },
          BufferVisibleWarn = { bg = colors.base, fg = colors.yellow },
          BufferVisibleInfo = { bg = colors.base, fg = colors.sky },
          BufferVisibleHint = { bg = colors.base, fg = colors.teal },

          -- barbar inactive
          BufferInactive = { bg = colors.mantle, fg = colors.overlay0 },
          BufferInactiveMod = { bg = colors.mantle, fg = colors.overlay0 },
          BufferInactiveModBtn = { bg = colors.mantle, fg = colors.peach },
          BufferInactiveBtn = { bg = colors.mantle, fg = colors.overlay0 },
          BufferInactiveSign = { bg = colors.mantle, fg = colors.surface0 },
          BufferInactiveSignRight = { bg = colors.mantle, fg = colors.surface0 },

          BufferInactiveError = { bg = colors.mantle, fg = colors_utils.darken(colors.red, 0.5, colors.mantle) },
          BufferInactiveWarn = { bg = colors.mantle, fg = colors_utils.darken(colors.yellow, 0.5, colors.mantle) },
          BufferInactiveInfo = { bg = colors.mantle, fg = colors_utils.darken(colors.sky, 0.5, colors.mantle) },
          BufferInactiveHint = { bg = colors.mantle, fg = colors_utils.darken(colors.teal, 0.5, colors.mantle) },
        }
      end
    })

    vim.cmd.colorscheme "catppuccin-macchiato"
  end,
}
