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

        -- bufferline
        BufferlineProjectExplorer = { fg = colors.lavender, bg = colors.mantle },
        BufferlineSideBar = { fg = colors.lavender, bg = colors.base },

        BufferLineOffsetSeparator = { link = "WinSeparator" },
        BufferLineTruncMarker = { fg = colors.surface2, bg = colors.crust },
        BufferLineFill = { bg = colors.crust },

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

        BufferLineBufferVisible = { fg = colors.text, bg = colors.mantle },
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

        BufferLineErrorDiagnosticSelected = { bg = colors.base, fg = colors.red, style = {"bold"} },
        BufferLineWarningDiagnosticSelected = { bg = colors.base, fg = colors.yellow, style = {"bold"} },
        BufferLineInfoDiagnosticSelected = { bg = colors.base, fg = colors.sky, style = {"bold"} },
        BufferLineHintDiagnosticSelected = { bg = colors.base, fg = colors.teal, style = {"bold"} },

        BufferLineCloseButtonSelected = {bg = colors.base, fg = colors.red },

        -- neotree
        NeoTreeWinSeparator = { link = "WinSeparator" },
        NeoTreeIndentMarker = { link = "LineNr" },
        NeoTreeExpander = { link = "LineNr" },

        NeoTreeDotfile = { fg = colors.overlay0 },
        NeoTreeProjectName = { fg = colors.blue },
        NeoTreeProjectPath = { link = "NeoTreeDotfile" },

        -- show keys
        SkActive = { fg = colors.mantle, bg = colors.lavender },
        SkInactive = { fg = colors.text, bg = colors.surface0 },

        -- blink
        -- blink completion dictionary
        BlinkCmpKindDict = { fg = colors.teal },

        -- mini indent scope
        MiniIndentscopeSymbol = { fg = colors.surface2 },

        -- fidget
        FidgetNormal = { link = "NormalFloat" },
        FidgetBorder = { link = "FloatBorder" },

        -- incline
        InclineNormal = { fg = colors.subtext0, bg = colors.mantle },
        InclineNormalNC = { link = "InclineNormal" },

        InclineSeparator = { fg = colors.overlay0, bg = colors.mantle },

        InclineLsp = { link = "InclineNormal" },
        InclineLinter = { link = "InclineNormal" },
        InclineFormatter = { link = "InclineNormal" },

        -- snacks
        SnacksWinBar = { fg = colors.lavender },

        -- trouble
        TroubleNormal = { bg = colors.base },
        TroubleNormalNc = { link = "TroubleNormal" },

        -- neotest
        NeotestIndent = { link = "LineNr" },
        NeotestExpandMarker = { link = "LineNr" },
      }
    end,
  },
}
