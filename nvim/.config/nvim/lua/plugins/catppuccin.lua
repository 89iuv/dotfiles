return {
  "catppuccin/nvim",
  enabled = true,
  opts = {
    term_colors = true,
    integrations = {
      barbar = true,
      fidget = true,
      neotest = true,
    },
    custom_highlights = function(colors)
      local colors_utils = require("catppuccin.utils.colors")

      return {
        -- catppuccin
        NormalSide = { fg = colors.text, bg = colors.mantle },
        SideWinbar = { fg = colors.lavender, bg = colors.mantle },

        NormalPopup = { fg = colors.text, bg = colors_utils.blend(colors.base, colors.mantle, 0.5) },
        PopupBorder = { fg = colors.subtext0, bg = colors_utils.blend(colors.base, colors.mantle, 0.5) },
        PopupTitle = { fg = colors.lavender, bg = colors_utils.blend(colors.base, colors.mantle, 0.5) },

        NormalFloat = { fg = colors.text, bg = colors.mantle },
        FloatBorder = { fg = colors.subtext0, bg = colors.mantle },
        FloatTitle = { fg = colors.lavender, bg = colors.mantle },

        WinSeparator = { fg = colors.overlay0, bg = colors_utils.blend(colors.base, colors.mantle, 0.75) },

        StatusLine = { bg = colors_utils.blend(colors.mantle, colors.crust, 0.5) },
        LineNr = { fg = colors.surface2 },
        Folded = { fg = colors.blue, bg = colors.surface0 },

        -- bufferline
        BufferlineProjectExplorer = { link = "SideWinbar" },
        BufferlineSideBar = { link = "SideWinbar" },

        BufferLineSeparator = { fg = colors.surface2, bg = colors.mantle },
        BufferLineOffsetSeparator = { link = "WinSeparator" },

        BufferLineIndicatorSelected = { fg = colors.lavender, bg = colors.base },
        BufferLineTruncMarker = { fg = colors.surface2, bg = colors_utils.blend(colors.mantle, colors.crust, 0.5) },
        BufferLineFill = { bg = colors_utils.blend(colors.mantle, colors.crust, 0.5) },

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

        BufferLineErrorDiagnostic = { bg = colors.mantle, fg = colors_utils.darken(colors.red, 0.75, colors.mantle) },
        BufferLineWarningDiagnostic = { bg = colors.mantle, fg = colors_utils.darken(colors.yellow, 0.75, colors.mantle) },
        BufferLineInfoDiagnostic = { bg = colors.mantle, fg = colors_utils.darken(colors.sky, 0.75, colors.mantle) },
        BufferLineHintDiagnostic = { bg = colors.mantle, fg = colors_utils.darken(colors.teal, 0.75, colors.mantle) },

        -- neotree
        NeoTreeNormal = { link = "NormalSide" },
        NeoTreeNormalNC = { link = "NormalSide" },

        -- NeoTreeWinSeparator = { fg = colors.base, bg = colors.base },
        NeoTreeWinSeparator = { link = "WinSeparator" },
        NeoTreeIndentMarker = { fg = colors.surface1 },
        NeoTreeExpander = { fg = colors.surface1 },

        -- whichkey
        WhichKey = { link = "NormalPopup" },
        WhichKeyBorder = { link = "PopupBorder" },
        WhichKeyTitle = { link = "PopupTitle" },
        WhichKeyNormal = { link = "NormalPopup" },

        -- code indents
        IblIndent = { fg = colors.surface0 },
        MiniIndentscopeSymbol = { fg = colors.overlay1 },

        -- virtual column
        VirtColumn = { fg = colors.surface0 },

        -- show keys
        SkActive = { fg = colors.crust, bg = colors.lavender },

        -- iluminate
        IlluminatedWordText = { bg = colors.surface1 },
        IlluminatedWordRead = { bg = colors.surface1 },
        IlluminatedWordWrite = { bg = colors.surface1 },

        -- blink_cmp
        BlinkCmpMenu = { bg = colors_utils.blend(colors.base, colors.mantle, 0.5) },
        BlinkCmpMenuBorder = { fg = colors.surface2, bg = colors_utils.blend(colors.base, colors.mantle, 0.5) },
        BlinkCmpMenuSelection = { bg = colors.surface0, style = { "bold" } },

        BlinkCmpDoc = { bg = colors_utils.blend(colors.base, colors.mantle, 0.5) },
        BlinkCmpDocBorder = { fg = colors.surface2, bg = colors_utils.blend(colors.base, colors.mantle, 0.5) },
        BlinkCmpDocSeparator = { fg = colors.surface2, bg = colors_utils.blend(colors.base, colors.mantle, 0.5) },

        BlinkCmpSignatureHelp = { bg = colors.mantle },
        BlinkCmpSignatureHelpBorder = { fg = colors.surface2, bg = colors.mantle },

        -- blink_cmp_dictionary
        BlinkCmpKindDict = { fg = colors.teal },

        -- fidget
        FidgetNormal = { fg = colors.subtext0, bg = colors_utils.blend(colors.mantle, colors.crust, 0.5) },
        FidgetBorder = { fg = colors.overlay2, bg = colors_utils.blend(colors.mantle, colors.crust, 0.5) },

        -- incline
        InclineNormal = { fg = colors.subtext0, bg = colors_utils.blend(colors.mantle, colors.crust, 0.5) },
        InclineNormalNC = { link = "InclineNormal" },

        InclineSeparator = { fg = colors.overlay0, bg = colors_utils.blend(colors.mantle, colors.crust, 0.5) },

        InclineLsp = { link = "InclineNormal" },
        InclineLinter = { link = "InclineNormal" },
        InclineFormatter = { link = "InclineNormal" },

        -- noice
        NoiceConfirm = { link = "NormalPopup" },
        NoiceConfirmBorder = { link = "PopupBorder" },

        NoiceCmdlinePopup = { link = "NormalPopup" },
        NoiceCmdlinePopupBorder = { link = "PopupBorder" },
        NoiceCmdlinePopupBorderSearch = { link = "PopupBorder" },

        NoiceCmdlinePopupTitleSearch = { link = "PopupTitle" },
        NoiceCmdlinePopupTitleLua = { link = "PopupTitle" },
        NoiceCmdlinePopupTitleHelp = { link = "PopupTitle" },
        NoiceCmdlinePopupTitleInput = { link = "PopupTitle" },
        NoiceCmdlinePopupTitleFilter = { link = "PopupTitle" },
        NoiceCmdlinePopupTitleCmdline = { link = "PopupTitle" },
        NoiceCmdlinePopupTitleCalculator = { link = "PopupTitle" },

        NoiceMini = { bg = colors_utils.blend(colors.mantle, colors.crust, 0.75) },

        -- snacks
        SnacksNotifierInfo = { link = "NormalPopup" },
        SnacksNotifierWarn = { link = "NormalPopup" },
        SnacksNotifierDebug = { link = "NormalPopup" },
        SnacksNotifierError = { link = "NormalPopup" },
        SnacksNotifierTrace = { link = "NormalPopup" },

        SnacksNotifierBorderInfo = { link = "PopupBorder" },
        SnacksNotifierBorderWarn = { link = "PopupBorder" },
        SnacksNotifierBorderDebug = { link = "PopupBorder" },
        SnacksNotifierBorderError = { link = "PopupBorder" },
        SnacksNotifierBorderTrace = { link = "PopupBorder" },

        SnacksPickerCol = { fg = colors.overlay0 },
        SnacksWinBar = { link = "SideWinbar" },
        SnacksTerminal = { link = "NormalSide" },

        -- SnacksInputIcon
        SnacksInputNormal = { link = "NormalPopup" },
        SnacksInputTitle = { link = "PopupTitle" },
        SnacksInputBorder = { link = "PopupBorder" },

        -- trouble
        TroubleNormal = { link = "NormalSide" },
        TroubleNormalNc = { link = "TroubleNormal" },
        TroubleIndent = { fg = colors.surface1 },

        -- neotest
        NeotestIndent = { link = "NeoTreeIndentMarker" },
        NeotestExpandMarker = { link = "NeoTreeIndentMarker" },

        -- markdown
        RenderMarkdownH1Bg = { bg = colors_utils.darken(colors.red, 0.2, colors.base) },
        RenderMarkdownH2Bg = { bg = colors_utils.darken(colors.peach, 0.2, colors.base) },
        RenderMarkdownH3Bg = { bg = colors_utils.darken(colors.yellow, 0.2, colors.base) },
        RenderMarkdownH4Bg = { bg = colors_utils.darken(colors.green, 0.2, colors.base) },
        RenderMarkdownH5Bg = { bg = colors_utils.darken(colors.sapphire, 0.2, colors.base) },
        RenderMarkdownH6Bg = { bg = colors_utils.darken(colors.lavender, 0.2, colors.base) },

        RenderMarkdownInlineHighlight = {
          fg = colors.rosewater,
          bg = colors_utils.darken(colors.rosewater, 0.2, colors.base),
        },
        RenderMarkdownQuote = { fg = colors.subtext0 },

        ["@markup.strong.markdown_inline"] = { fg = colors.text, style = { "bold" } },
        ["@markup.italic.markdown_inline"] = { fg = colors.text, style = { "italic" } },

        ["@markup.quote.markdown"] = { link = "RenderMarkdownQuote" },
        ["@markup.link.url"] = { fg = colors.rosewater, sp = colors.rosewater, style = { "italic", "underline" } },
        ["@markup.link.label"] = { fg = colors.sapphire, sp = colors.sapphire, style = {} },
        ["@markup.link"] = { fg = colors.lavender, sp = colors.lavender, style = {} },

        -- treesitter
        ["@string.special.url"] = { fg = colors.rosewater, sp = colors.rosewater, style = { "italic", "underline" } },
      }
    end,
  },
}
