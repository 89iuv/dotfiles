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
              },
              inactive = {
                c = { bg = colors.crust },
              },
            }
          end,
        },
      },

      custom_highlights = function(colors)
        local colors_utils = require("catppuccin.utils.colors")

        return {
          -- neovim
          FloatBorder = { fg = colors.overlay0, bg = colors.mantle },

          WinSeparator = { fg = colors.surface0, bg = colors.base },
          LineNr = { fg = colors.overlay0 },

          -- neotree
          NeoTreeWinSeparator = { fg = colors.surface0, bg = colors.base },
          NeoTreeIndentMarker = { fg = colors.surface1 },

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
          BufferCurrentSign = { bg = colors.base, fg = colors.lavender },

          BufferCurrentError = { bg = colors.base, fg = colors.red },
          BufferCurrentWarn = { bg = colors.base, fg = colors.yellow },
          BufferCurrentInfo = { bg = colors.base, fg = colors.sky },
          BufferCurrentHint = { bg = colors.base, fg = colors.teal },

          BufferCurrentADDED = { bg = colors.base, fg = colors.green },
          BufferCurrentCHANGED = { bg = colors.base, fg = colors.peach },
          BufferCurrentDELETED = { bg = colors.base, fg = colors.maroon },

          -- barbar visible
          BufferVisible = { bg = colors.mantle, fg = colors.text },
          BufferVisibleMod = { bg = colors.mantle, fg = colors.text },
          BufferVisibleModBtn = { bg = colors.mantle, fg = colors.peach },
          BufferVisibleBtn = { bg = colors.mantle, fg = colors.text },
          BufferVisibleSign = { bg = colors.mantle, fg = colors.surface0 },

          BufferVisibleError = { bg = colors.mantle, fg = colors.red },
          BufferVisibleWarn = { bg = colors.mantle, fg = colors.yellow },
          BufferVisibleInfo = { bg = colors.mantle, fg = colors.sky },
          BufferVisibleHint = { bg = colors.mantle, fg = colors.teal },

          BufferVisibleADDED = { bg = colors.mantle, fg = colors.green },
          BufferVisibleCHANGED = { bg = colors.mantle, fg = colors.peach },
          BufferVisibleDELETED = { bg = colors.mantle, fg = colors.maroon },

          -- barbar inactive
          BufferInactive = { bg = colors.mantle, fg = colors.overlay0 },
          BufferInactiveMod = { bg = colors.mantle, fg = colors.overlay0 },
          BufferInactiveModBtn = { bg = colors.mantle, fg = colors.peach },
          BufferInactiveBtn = { bg = colors.mantle, fg = colors.overlay0 },
          BufferInactiveSign = { bg = colors.mantle, fg = colors.surface0 },

          BufferInactiveError = { bg = colors.mantle, fg = colors_utils.darken(colors.red, 0.5, colors.mantle) },
          BufferInactiveWarn = { bg = colors.mantle, fg = colors_utils.darken(colors.yellow, 0.5, colors.mantle) },
          BufferInactiveInfo = { bg = colors.mantle, fg = colors_utils.darken(colors.sky, 0.5, colors.mantle) },
          BufferInactiveHint = { bg = colors.mantle, fg = colors_utils.darken(colors.teal, 0.5, colors.mantle) },

          BufferInactiveADDED = { bg = colors.mantle, fg = colors_utils.darken(colors.green, 0.5, colors.mantle) },
          BufferInactiveCHANGED = { bg = colors.mantle, fg = colors_utils.darken(colors.peach, 0.5, colors.mantle) },
          BufferInactiveDELETED = { bg = colors.mantle, fg = colors_utils.darken(colors.maroon, 0.5, colors.mantle) },

          -- whichkey
          WhKeyIcon = { style = {} },

          -- blink border
          BlinkCmpMenuBorder = { link = "FloatBorder" },
          BlinkCmpDocBorder = { link = "BlinkCmpMenuBorder" },

        }
      end
    })

    vim.cmd.colorscheme "catppuccin-macchiato"
  end,
}
