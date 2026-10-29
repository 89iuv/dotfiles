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
        illuminate = {
          enabled = true,
          lsp = false,
        },
        dashboard = true,
      },

      custom_highlights = function(colors)
        local colors_utils = require("catppuccin.utils.colors")
        local barbar_background = require("catppuccin.utils.colors").darken(colors.mantle, 0.5, colors.crust)

        return {
          -- neovim
          FloatBorder = { fg = colors.overlay0, bg = colors.mantle },

          WinSeparator = { fg = colors.crust, bg = colors.base },
          LineNr = { fg = colors.overlay0 },

          FoldColumn = { fg = colors.overlay1 },
          LspInlayHint = {
            fg = colors.overlay0,
            bg = require("catppuccin.utils.colors").darken(colors.surface0, 0.25, colors.base),
          },

          -- neotree
          NeoTreeWinSeparator = { fg = colors.base, bg = colors.base },
          NeoTreeIndentMarker = { fg = colors.surface1 },

          NeoTreeDotfile = { fg = colors.overlay0 },
          NeoTreeProjectName = { fg = colors.blue },
          NeoTreeProjectPath = { link = "NeoTreeDotfile" },

          -- barbar
          BufferOffset = { bg = colors.mantle },
          BufferScrollArrow = { fg = colors.lavender, bg = barbar_background },
          BufferTabpageFill = { bg = barbar_background },

          -- barbar current
          BufferCurrent = { bg = colors.base, fg = colors.lavender, style = { "bold" } },
          BufferCurrentMod = { bg = colors.base, fg = colors.lavender, style = { "bold" } },
          BufferCurrentModBtn = { bg = colors.base, fg = colors.peach },
          BufferCurrentBtn = { bg = colors.base, fg = colors.red },
          BufferCurrentSign = { bg = barbar_background, fg = colors.lavender },

          BufferCurrentError = { bg = colors.base, fg = colors.red },
          BufferCurrentWarn = { bg = colors.base, fg = colors.yellow },
          BufferCurrentInfo = { bg = colors.base, fg = colors.sky },
          BufferCurrentHint = { bg = colors.base, fg = colors.teal },

          BufferCurrentADDED = { bg = colors.base, fg = colors.green },
          BufferCurrentCHANGED = { bg = colors.base, fg = colors.peach },
          BufferCurrentDELETED = { bg = colors.base, fg = colors.maroon },

          -- barbar visible
          BufferVisible = { bg = barbar_background, fg = colors.text },
          BufferVisibleMod = { bg = barbar_background, fg = colors.text },
          BufferVisibleModBtn = { bg = barbar_background, fg = colors.peach },
          BufferVisibleBtn = { bg = barbar_background, fg = colors.text },
          BufferVisibleSign = { bg = barbar_background, fg = colors.surface0 },

          BufferVisibleError = { bg = barbar_background, fg = colors.red },
          BufferVisibleWarn = { bg = barbar_background, fg = colors.yellow },
          BufferVisibleInfo = { bg = barbar_background, fg = colors.sky },
          BufferVisibleHint = { bg = barbar_background, fg = colors.teal },

          BufferVisibleADDED = { bg = barbar_background, fg = colors.green },
          BufferVisibleCHANGED = { bg = barbar_background, fg = colors.peach },
          BufferVisibleDELETED = { bg = barbar_background, fg = colors.maroon },

          -- barbar inactive
          BufferInactive = { bg = barbar_background, fg = colors.overlay0 },
          BufferInactiveMod = { bg = barbar_background, fg = colors.overlay0 },
          BufferInactiveModBtn = { bg = barbar_background, fg = colors.peach },
          BufferInactiveBtn = { bg = barbar_background, fg = colors.overlay0 },
          BufferInactiveSign = { bg = barbar_background, fg = colors.surface0 },

          BufferInactiveError = {
            bg = barbar_background,
            fg = colors_utils.darken(colors.red, 0.5, barbar_background),
          },
          BufferInactiveWarn = {
            bg = barbar_background,
            fg = colors_utils.darken(colors.yellow, 0.5, barbar_background),
          },
          BufferInactiveInfo = {
            bg = barbar_background,
            fg = colors_utils.darken(colors.sky, 0.5, barbar_background),
          },
          BufferInactiveHint = {
            bg = barbar_background,
            fg = colors_utils.darken(colors.teal, 0.5, barbar_background),
          },
          BufferInactiveADDED = {
            bg = barbar_background,
            fg = colors_utils.darken(colors.green, 0.5, barbar_background),
          },
          BufferInactiveCHANGED = {
            bg = barbar_background,
            fg = colors_utils.darken(colors.peach, 0.5, barbar_background),
          },
          BufferInactiveDELETED = {
            bg = barbar_background,
            fg = colors_utils.darken(colors.maroon, 0.5, barbar_background),
          },

          -- whichkey
          WhKeyIcon = { style = {} },

          -- blink
          BlinkCmpMenuBorder = { link = "FloatBorder" },
          BlinkCmpDocBorder = { link = "BlinkCmpMenuBorder" },

          BlinkCmpSource = { fg = colors.subtext1, bg = colors.mantle },

          -- blink indent
          BlinkIndent = { fg = colors.surface0 },
          BlinkIndentScope = { fg = colors.overlay0 },

          -- virtual column
          VirtColumn = { fg = colors.surface0 },

        }
      end,
    })

    vim.cmd.colorscheme("catppuccin-macchiato")
  end,
}
