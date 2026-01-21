return {
  "catppuccin/nvim",
  enabled = true,
  opts = {
    term_colors = true,
    auto_integrations = true,

    custom_highlights = function(colors)
      local colors_utils = require("catppuccin.utils.colors")

      return {
        -- catppuccin
        FloatBorder = { fg = colors.lavender, bg = colors.mantle },
        FloatTitle = { fg = colors.lavender, bg = colors.mantle },

        WinSeparator = { fg = colors.overlay0, bg = colors.base },
        StatusLine = { bg = colors.crust },

        Folded = { bg = colors.surface0 },

        LspInlayHint = { fg = colors.overlay0, bg = "NONE", style = { "italic" } },

        -- bufferline
        BufferLineFill = { bg = colors.mantle },

        BufferlineProjectExplorer = { fg = colors.lavender, bg = colors.mantle },
        BufferlineSideBar = { fg = colors.lavender, bg = colors.mantle },
        BufferLineSeparator = { fg = colors.overlay0, bg = colors.mantle },

        BufferLineIndicatorVisible = { fg = colors.lavender, bg = colors.mantle },
        BufferLineIndicatorSelected = { fg = colors.lavender, bg = colors.base },

        BufferLineOffsetSeparator = { fg = colors.overlay0, bg = colors.mantle },
        BufferLineTruncMarker = { fg = colors.surface2, bg = colors.mantle },

        BufferLineBuffer = { fg = colors.overlay2, bg = colors.mantle },
        BufferLineError = { link = "BufferLineBuffer" },
        BufferLineWarning = { link = "BufferLineBuffer" },
        BufferLineInfo = { link = "BufferLineBuffer" },
        BufferLineHint = { link = "BufferLineBuffer" },

        BufferLineBufferSelected = { fg = colors.lavender, bg = colors.base, style = { "bold" } },
        BufferLineErrorSelected = { link = "BufferLineBufferSelected" },
        BufferLineWarningSelected = { link = "BufferLineBufferSelected" },
        BufferLineHintSelected = { link = "BufferLineBufferSelected" },
        BufferLineInfoSelected = { link = "BufferLineBufferSelected" },

        BufferLineBufferVisible = { fg = colors.lavender, bg = colors.mantle },
        BufferLineErrorVisible = { link = "BufferLineBufferVisible" },
        BufferLineWarningVisible = { link = "BufferLineBufferVisible" },
        BufferLineInfoVisible = { link = "BufferLineBufferVisible" },
        BufferLineHintVisible = { link = "BufferLineBufferVisible" },

        BufferLineErrorDiagnostic = {
          bg = colors.mantle,
          fg = colors_utils.darken(colors.red, 0.5, colors.mantle),
        },
        BufferLineWarningDiagnostic = {
          bg = colors.mantle,
          fg = colors_utils.darken(colors.yellow, 0.5, colors.mantle),
        },
        BufferLineInfoDiagnostic = {
          bg = colors.mantle,
          fg = colors_utils.darken(colors.sky, 0.5, colors.mantle),
        },
        BufferLineHintDiagnostic = {
          bg = colors.mantle,
          fg = colors_utils.darken(colors.teal, 0.5, colors.mantle),
        },

        -- neotree
        NeoTreeWinSeparator = { link = "WinSeparator" },
        NeoTreeIndentMarker = { link = "LineNr" },
        NeoTreeExpander = { link = "LineNr" },

        NeoTreeDotfile = { fg = colors.overlay0 },
        NeoTreeProjectName = { fg = colors.blue },
        NeoTreeProjectPath = { link = "NeoTreeDotfile" },

        -- blink border
        BlinkCmpMenuBorder = { fg = colors.surface2, bg = colors.mantle },
        BlinkCmpDocBorder = { link = "BlinkCmpMenuBorder" },

        -- blink completion dictionary
        BlinkCmpKindDict = { fg = colors.teal },

        -- mini indent scope
        MiniIndentscopeSymbol = { fg = colors.surface2 },

        -- incline
        InclineNormal = { fg = colors.subtext0, bg = colors.mantle },
        InclineNormalNC = { link = "InclineNormal" },

        InclineSeparator = { fg = colors.overlay0, bg = colors.mantle },

        InclineLsp = { link = "InclineNormal" },
        InclineLinter = { link = "InclineNormal" },
        InclineFormatter = { link = "InclineNormal" },

        -- snacks
        SnacksWinBar = { fg = colors.lavender, bg = colors.mantle },
        SnacksTerminal = { bg = colors.mantle },

        -- trouble
        TroubleNormal = { bg = colors.mantle },
        TroubleNormalNc = { link = "TroubleNormal" },

        -- markdown renderer
        RenderMarkdownCode = { bg = colors_utils.darken(colors.base, 0.5, colors.mantle) },
      }
    end,
  },
}
