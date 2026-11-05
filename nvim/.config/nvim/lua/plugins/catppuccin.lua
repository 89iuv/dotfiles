return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    -- ANSI palette copied from the Windows Terminal scheme
    local wt = {
      "#494d64", -- 0  black
      "#ed8796", -- 1  red
      "#a6da95", -- 2  green
      "#eed49f", -- 3  yellow
      "#8aadf4", -- 4  blue
      "#f5bde6", -- 5  purple
      "#8bd5ca", -- 6  cyan
      "#b8c0e0", -- 7  white
      "#5b6078", -- 8  bright black
      "#ed8796", -- 9  bright red
      "#a6da95", -- 10 bright green
      "#eed49f", -- 11 bright yellow
      "#8aadf4", -- 12 bright blue
      "#f5bde6", -- 13 bright purple
      "#8bd5ca", -- 14 bright cyan
      "#a5adcb", -- 15 bright white
    }

    -- overwrite terminal colors
    for i, color in ipairs(wt) do
      vim.g["terminal_color_" .. (i - 1)] = color
    end

    require("catppuccin").setup({
      flavour = "macchiato",
      term_colors = false,
      auto_integrations = true,
      integrations = {
        dashboard = true,
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
        -- local barbar_background = require("catppuccin.utils.colors").darken(colors.mantle, 0.5, colors.crust)
        local barbar_background = colors.mantle

        return {
          -- neovim
          FloatBorder = { fg = colors.overlay0, bg = colors.mantle },
          FloatTitle = { fg = colors.lavender, bg = colors.mantle },

          WinSeparator = { fg = colors.surface2, bg = colors_utils.darken(colors.base, 0.5, colors.mantle) },
          LineNr = { fg = colors.surface2 },

          FoldColumn = { fg = colors.overlay1 },

          LspInlayHint = {
            fg = colors.overlay0,
            bg = colors_utils.darken(colors.surface0, 0.25, colors.base),
          },

          -- neotree
          NeoTreeWinSeparator = { link = "WinSeparator" },
          NeoTreeIndentMarker = { fg = colors.surface0 },

          NeoTreeDotfile = { fg = colors.overlay0 },
          NeoTreeProjectName = { fg = colors.blue, style = { "bold" } },
          NeoTreeProjectPath = { link = "NeoTreeProjectName" },

          -- barbar
          BufferOffset = { fg = colors.lavender, bg = colors.mantle },
          BufferOffsetSeparator = { link = "NeoTreeWinSeparator" },
          BufferScrollArrow = { fg = colors.text, bg = barbar_background },
          BufferTabpageFill = { bg = barbar_background },

          -- barbar current
          BufferCurrent = { bg = colors.base, fg = colors.lavender, style = { "bold" } },
          BufferCurrentMod = { bg = colors.base, fg = colors.lavender, style = { "bold" } },
          BufferCurrentModBtn = { bg = colors.base, fg = colors.peach },
          BufferCurrentBtn = { bg = colors.base, fg = colors.maroon },
          BufferCurrentSign = { bg = barbar_background, fg = colors.lavender },

          BufferCurrentError = { bg = colors.base, fg = colors.red },
          BufferCurrentWarn = { bg = colors.base, fg = colors.yellow },
          BufferCurrentInfo = { bg = colors.base, fg = colors.sky },
          BufferCurrentHint = { bg = colors.base, fg = colors.teal },

          BufferCurrentADDED = { bg = colors.base, fg = colors.green },
          BufferCurrentCHANGED = { bg = colors.base, fg = colors.yellow },
          BufferCurrentDELETED = { bg = colors.base, fg = colors.red },

          -- barbar visible
          BufferVisible = { bg = barbar_background, fg = colors.subtext0 },
          BufferVisibleMod = { bg = barbar_background, fg = colors.subtext0 },
          BufferVisibleModBtn = { bg = barbar_background, fg = colors.peach },
          BufferVisibleBtn = { bg = barbar_background, fg = colors.subtext0 },
          BufferVisibleSign = { bg = barbar_background, fg = colors.surface0 },

          BufferVisibleError = { bg = barbar_background, fg = colors.red },
          BufferVisibleWarn = { bg = barbar_background, fg = colors.yellow },
          BufferVisibleInfo = { bg = barbar_background, fg = colors.sky },
          BufferVisibleHint = { bg = barbar_background, fg = colors.teal },

          BufferVisibleADDED = { bg = barbar_background, fg = colors.green },
          BufferVisibleCHANGED = { bg = barbar_background, fg = colors.yellow },
          BufferVisibleDELETED = { bg = barbar_background, fg = colors.red },

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
            fg = colors_utils.darken(colors.yellow, 0.5, barbar_background),
          },
          BufferInactiveDELETED = {
            bg = barbar_background,
            fg = colors_utils.darken(colors.red, 0.5, barbar_background),
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

          -- trouble
          TroubleNormal = { bg = colors.mantle },

          -- snacks notification
          SnacksNotifierInfo = { bg = colors.mantle },
          SnacksNotifierWarn = { bg = colors.mantle },
          SnacksNotifierDebug = { bg = colors.mantle },
          SnacksNotifierError = { bg = colors.mantle },
          SnacksNotifierTrace = { bg = colors.mantle },

          SnacksNotifierTitleInfo = { bg = colors.mantle, style = {} },
          SnacksNotifierTitleWarn = { bg = colors.mantle, style = {} },
          SnacksNotifierTitleDebug = { bg = colors.mantle, style = {} },
          SnacksNotifierTitleError = { bg = colors.mantle, style = {} },
          SnacksNotifierTitleTrace = { bg = colors.mantle, style = {} },

          SnacksNotifierBorderInfo = { link = "FloatBorder" },
          SnacksNotifierBorderWarn = { link = "FloatBorder" },
          SnacksNotifierBorderDebug = { link = "FloatBorder" },
          SnacksNotifierBorderError = { link = "FloatBorder" },
          SnacksNotifierBorderTrace = { link = "FloatBorder" },

          SnacksNotifierFooterInfo = { link = "SnacksNotifierTitleInfo" },
          SnacksNotifierFooterWarn = { link = "SnacksNotifierTitleWarn" },
          SnacksNotifierFooterDebug = { link = "SnacksNotifierTitleDebug" },
          SnacksNotifierFooterError = { link = "SnacksNotifierTitleError" },
          SnacksNotifierFooterTrace = { link = "SnacksNotifierTitleTrace" },

          -- snacks input
          SnacksInputNormal = { bg = colors.mantle },
          SnacksInputBorder = { link = "FloatBorder" },
          SnacksInputTitle = { link = "FloatTitle" },
          SnacksInputIcon = { fg = colors.teal, style = {} },

          -- snacks terminal
          SnacksWinBar = { fg = colors.lavender, bg = colors.mantle },
          SnacksTerminal = { bg = colors.mantle },

          -- ufo
          MoreMsg = { fg = colors.blue, bg = colors.surface1 },
        }
      end,
    })

    vim.cmd.colorscheme("catppuccin-macchiato")
  end,
}
