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

        Folded = { fg = colors.overlay0, bg = colors.surface0, style = { "italic" } },
        LspInlayHint = { fg = colors.overlay0, bg = "NONE", style = { "italic" } },

         -- barbar
        BufferOffset = { fg = colors.lavender, bg = colors.mantle },
        BufferScrollArrow = { fg = colors.surface2, bg = colors.mantle },
        BufferTabpageFill = { fg = colors.crust, bg = colors.mantle },

        -- barbar current
        BufferCurrent = { bg = colors.base, fg = colors.lavender, style = { "bold" } },
        BufferCurrentMod = { bg = colors.base, fg = colors.lavender, style = { "bold" } },
        BufferCurrentModBtn = { bg = colors.base, fg = colors.peach },
        BufferCurrentBtn = { bg = colors.base, fg = colors.red },
        BufferCurrentSign = { bg = colors.mantle, fg = colors.lavender },

        -- barbar visible
        -- NOTE: used same style as current to workaroud the bug
        -- where the buffer is not displayed asa current but it is displayed as visible
        -- when splitting a window or switching from a floating window back to the buffer window
        BufferVisible = { bg = colors.base, fg = colors.lavender, style = { "bold" } },
        BufferVisibleMod = { bg = colors.base, fg = colors.lavender, style = { "bold" } },
        BufferVisibleModBtn = { bg = colors.base, fg = colors.peach },
        BufferVisibleBtn = { bg = colors.base, fg = colors.overlay2 },
        BufferVisibleSign = { bg = colors.mantle, fg = colors.lavender },

        BufferVisibleError = { bg = colors.base, fg = colors.red },
        BufferVisibleWarn = { bg = colors.base, fg = colors.yellow },
        BufferVisibleInfo = { bg = colors.base, fg = colors.sky },
        BufferVisibleHint = { bg = colors.base, fg = colors.teal },

        -- barbar inactive
        BufferInactive = { bg = colors.mantle, fg = colors.overlay0 },
        BufferInactiveMod = { bg = colors.mantle, fg = colors.overlay0 },
        BufferInactiveModBtn = { bg = colors.mantle, fg = colors.peach },
        BufferInactiveBtn = { bg = colors.mantle, fg = colors.overlay2 },
        BufferInactiveSign = { bg = colors.mantle, fg = colors.overlay0 },

        BufferInactiveError = { bg = colors.mantle, fg = colors_utils.darken(colors.red, 0.5, colors.mantle) },
        BufferInactiveWarn = { bg = colors.mantle, fg = colors_utils.darken(colors.yellow, 0.5, colors.mantle) },
        BufferInactiveInfo = { bg = colors.mantle, fg = colors_utils.darken(colors.sky, 0.5, colors.mantle) },
        BufferInactiveHint = { bg = colors.mantle, fg = colors_utils.darken(colors.teal, 0.5, colors.mantle) },

        -- bufferline
        BufferLineFill = { bg = colors.mantle },

        BufferlineProjectExplorer = { fg = colors.lavender, bg = colors.mantle },
        BufferlineSideBar = { fg = colors.lavender, bg = colors.mantle },
        BufferLineSeparator = { fg = colors.overlay0, bg = colors.mantle },

        BufferLineIndicatorVisible = { fg = colors.lavender, bg = colors.mantle },
        BufferLineIndicatorSelected = { fg = colors.lavender, bg = colors.base },

        BufferLineOffsetSeparator = { fg = colors.overlay0, bg = colors.mantle },
        BufferLineTruncMarker = { fg = colors.surface2, bg = colors.mantle },

        BufferLineBuffer = { fg = colors.overlay0, bg = colors.mantle },
        BufferLineBackground = { link = "BufferLineBuffer" },
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

        -- neotree
        NeoTreeWinSeparator = { link = "WinSeparator" },
        NeoTreeIndentMarker = { link = "LineNr" },
        NeoTreeExpander = { link = "LineNr" },

        NeoTreeDotfile = { fg = colors.overlay0 },
        NeoTreeProjectName = { fg = colors.blue },
        NeoTreeProjectPath = { link = "NeoTreeDotfile" },

        -- blink border
        BlinkCmpMenuBorder = { link = "FloatBorder" },
        BlinkCmpDocBorder = { link = "BlinkCmpMenuBorder" },
        BlinkCmpDocSeparator = { link = "@punctuation.special.markdown" },

        -- mini indent scope
        MiniIndentscopeSymbol = { fg = colors.surface2 },

        -- incline
        InclineNormal = { fg = colors.subtext0, bg = colors.mantle },
        InclineNormalNC = { link = "InclineNormal" },

        InclineSeparator = { fg = colors.overlay0, bg = colors.mantle },

        InclineLspIcon = { fg = colors.lavender },
        InclineLsp = { link = "InclineNormal" },

        InclineLinterIcon = { fg = colors.lavender },
        InclineLinter = { link = "InclineNormal" },

        InclineFormatterIcon = { fg = colors.lavender },
        InclineFormatter = { link = "InclineNormal" },

        -- virtual columnh
        VirtColumn = { fg = colors.surface0 },

        -- noice
        NoiceMini = { fg = colors.subtext0, bg = colors.mantle },

        NoiceFormatProgressTodo = { fg = colors.lavender, bg = colors.mantle },
        NoiceFormatProgressDone = { fg = colors.mantle, bg = colors.lavender },

        NoiceLspProgressTitle = { fg = colors.subtext0, bg = colors.mantle },
        NoiceLspProgressClient = { fg = colors.lavender, bg = colors.mantle },
        NoiceLspProgressSpinner = { fg = colors.lavender, bg = colors.mantle },

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
