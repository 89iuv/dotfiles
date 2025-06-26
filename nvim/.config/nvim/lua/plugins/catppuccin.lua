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
      local accent = colors.lavender
      local separator = colors.surface2
      local border = colors.surface2

      local layer0 = colors.base
      local layer1 = colors_utils.blend(colors.base, colors.mantle, 0.5)
      local layer2 = colors.mantle
      local layer3 = colors_utils.blend(colors.mantle, colors.crust, 0.5)
      local layer4 = colors.crust

      return {
        -- catppuccin
        NormalFloat = { fg = colors.text, bg = layer2 },
        FloatBorder = { fg = border, bg = layer2 },
        FloatTitle = { fg = colors.subtext1, bg = layer2 },

        WinBar = { fg = colors.overlay0, bg = colors.mantle },
        WinSeparator = { fg = separator, bg = layer1 },
        StatusLine = { bg = layer4 },

        LineNr = { fg = colors.surface2 },
        Folded = { fg = colors.blue, bg = colors.surface0 },

        -- bufferline
        BufferlineProjectExplorer = { fg = accent, bg = layer2 },

        BufferLineSeparator = { fg = separator, bg = layer2 },
        BufferLineOffsetSeparator = { link = "WinSeparator" },

        BufferLineIndicatorSelected = { fg = accent, bg = colors.base },
        BufferLineTruncMarker = { fg = colors.overlay0, bg = layer4 },
        BufferLineFill = { bg = layer3 },

        BufferLineBuffer = { fg = colors.overlay2, bg = layer2 },
        BufferLineError = { link = "BufferLineBuffer" },
        BufferLineWarning = { link = "BufferLineBuffer" },
        BufferLineInfo = { link = "BufferLineBuffer" },
        BufferLineHint = { link = "BufferLineBuffer" },

        BufferLineBufferSelected = { fg = accent, bg = layer0, style = { "bold" } },
        BufferLineErrorSelected = { link = "BufferLineBufferSelected" },
        BufferLineWarningSelected = { link = "BufferLineBufferSelected" },
        BufferLineHintSelected = { link = "BufferLineBufferSelected" },
        BufferLineInfoSelected = { link = "BufferLineBufferSelected" },

        BufferLineBufferVisible = { fg = colors.text, bg = layer2 },
        BufferLineErrorVisible = { link = "BufferLineBufferVisible" },
        BufferLineWarningVisible = { link = "BufferLineBufferVisible" },
        BufferLineInfoVisible = { link = "BufferLineBufferVisible" },
        BufferLineHintVisible = { link = "BufferLineBufferVisible" },

        BufferLineErrorDiagnostic = { bg = layer2, fg = colors_utils.darken(colors.red, 0.65, layer2) },
        BufferLineWarningDiagnostic = { bg = layer2, fg = colors_utils.darken(colors.yellow, 0.65, layer2) },
        BufferLineInfoDiagnostic = { bg = layer2, fg = colors_utils.darken(colors.sky, 0.65, layer2) },
        BufferLineHintDiagnostic = { bg = layer2, fg = colors_utils.darken(colors.teal, 0.65, layer2) },

        -- barbar
        BufferOffset = { fg = accent, bg = layer2 },
        BufferScrollArrow = { fg = colors.overlay0, bg = colors.mantle },
        BufferTabpageFill = { fg = layer4, bg = layer2 },

        -- barbar current
        BufferCurrent = { bg = layer0, fg = accent, style = { "bold" } },
        BufferCurrentMod = { bg = layer0, fg = accent },
        BufferCurrentModBtn = { bg = layer0, fg = colors.peach },
        BufferCurrentBtn = { bg = layer0, fg = colors.red },
        BufferCurrentSign = { bg = layer0, fg = separator },

        -- barbar visible
        BufferVisible = { bg = layer2, fg = colors.subtext0 },
        BufferVisibleMod = { bg = layer2, fg = colors.subtext0 },
        BufferVisibleModBtn = { bg = layer2, fg = colors.peach },
        BufferVisibleBtn = { bg = layer2, fg = colors.overlay2 },
        BufferVisibleSign = { bg = layer2, fg = separator },

        BufferVisibleError = { bg = layer2, fg = colors.red },
        BufferVisibleWarn = { bg = layer2, fg = colors.yellow },
        BufferVisibleInfo = { bg = layer2, fg = colors.sky },
        BufferVisibleHint = { bg = layer2, fg = colors.teal },

        -- barbar inactive
        BufferInactive = { bg = layer2, fg = colors_utils.darken(colors.subtext0, 0.5, layer2) },
        BufferInactiveMod = { bg = layer2, fg = colors_utils.darken(colors.subtext0, 0.5, layer2) },
        BufferInactiveModBtn = { bg = layer2, fg = colors.peach },
        BufferInactiveBtn = { bg = layer2, fg = colors.overlay2 },
        BufferInactiveSign = { bg = layer2, fg = separator },

        BufferInactiveError = { bg = layer2, fg = colors_utils.darken(colors.red, 0.5, layer2) },
        BufferInactiveWarn = { bg = layer2, fg = colors_utils.darken(colors.yellow, 0.5, layer2) },
        BufferInactiveInfo = { bg = layer2, fg = colors_utils.darken(colors.sky, 0.5, layer2) },
        BufferInactiveHint = { bg = layer2, fg = colors_utils.darken(colors.teal, 0.5, layer2) },

        -- neotree
        NeoTreeNormal = { bg = layer2 },
        NeoTreeNormalNC = { bg = layer2 },

        -- NeoTreeWinSeparator = { fg = layer0, bg = layer0 },
        NeoTreeWinSeparator = { link = "WinSeparator" },
        NeoTreeIndentMarker = { fg = colors.surface1 },
        NeoTreeExpander = { fg = colors.surface1 },

        -- indent blankline
        IblIndent = { fg = colors.surface0 },

        -- mini indent scope
        MiniIndentscopeSymbol = { fg = colors.overlay0 },

        -- virtual column
        VirtColumn = { fg = colors.surface0 },

        -- show keys
        SkActive = { fg = layer4, bg = accent },

        -- iluminate
        IlluminatedWordText = { bg = colors.surface1 },
        IlluminatedWordRead = { bg = colors.surface1 },
        IlluminatedWordWrite = { bg = colors.surface1 },

        -- blink_cmp
        BlinkCmpMenu = { bg = layer1 },
        BlinkCmpMenuBorder = { fg = border, bg = layer1 },
        BlinkCmpMenuSelection = { bg = colors.surface0, style = { "bold" } },

        BlinkCmpDoc = { bg = layer1 },
        BlinkCmpDocBorder = { fg = border, bg = layer1 },
        BlinkCmpDocSeparator = { fg = border, bg = layer1 },

        BlinkCmpSignatureHelp = { bg = layer1 },
        BlinkCmpSignatureHelpBorder = { fg = border, bg = layer1 },

        -- fidget
        FidgetNormal = { fg = colors.subtext0, bg = layer3 },
        FidgetBorder = { fg = colors.overlay2, bg = layer3 },

        -- incline
        InclineNormal = { fg = colors.subtext0, bg = layer1 },
        InclineNormalNC = { fg = colors.subtext0, bg = layer1 },
        InclineSeparator = { fg = separator, bg = layer1 },

        -- noice
        NoiceConfirm = { link = "NormalFloat" },
        NoiceConfirmBorder = { link = "FloatBorder" },

        NoiceCmdlinePopup = { link = "NormalFloat" },
        NoiceCmdlinePopupBorder = { link = "FloatBorder" },
        NoiceCmdlinePopupBorderSearch = { link = "FloatBorder" },

        NoiceCmdlinePopupTitleSearch = { link = "FloatTitle" },
        NoiceCmdlinePopupTitleLua = { link = "FloatTitle" },
        NoiceCmdlinePopupTitleHelp = { link = "FloatTitle" },
        NoiceCmdlinePopupTitleInput = { link = "FloatTitle" },
        NoiceCmdlinePopupTitleFilter = { link = "FloatTitle" },
        NoiceCmdlinePopupTitleCmdline = { link = "FloatTitle" },
        NoiceCmdlinePopupTitleCalculator = { link = "FloatTitle" },

        NoiceMini = { bg = colors.mantle },

        -- snacks
        SnacksNotifierInfo = { link = "NormalFloat" },
        SnacksNotifierWarn = { link = "NormalFloat" },
        SnacksNotifierDebug = { link = "NormalFloat" },
        SnacksNotifierError = { link = "NormalFloat" },
        SnacksNotifierTrace = { link = "NormalFloat" },

        SnacksNotifierBorderInfo = { link = "FloatBorder" },
        SnacksNotifierBorderWarn = { link = "FloatBorder" },
        SnacksNotifierBorderDebug = { link = "FloatBorder" },
        SnacksNotifierBorderError = { link = "FloatBorder" },
        SnacksNotifierBorderTrace = { link = "FloatBorder" },

        SnacksPickerCol = { fg = colors.overlay0 },
        SnacksWinBar = { fg = accent, bg = colors.mantle },

        -- SnacksInputIcon
        SnacksInputNormal = { link = "NormalFloat", },
        SnacksInputTitle = { link = "FloatTitle" },
        SnacksInputBorder = { link = "FloatBorder" },

        -- trouble
        TroubleNormal = { link = "NormalFloat" },
        TroubleNormalNc = { link = "TroubleNormal" },
        TroubleIndent = { fg = colors.surface1 },

        -- neotest
        NeotestIndent = { link = "NeoTreeIndentMarker" },
        NeotestExpandMarker = { link = "NeoTreeIndentMarker" },

        -- markdown
        RenderMarkdownH1Bg = { bg = colors_utils.darken(colors.red, 0.2, layer0) },
        RenderMarkdownH2Bg = { bg = colors_utils.darken(colors.peach, 0.2, layer0) },
        RenderMarkdownH3Bg = { bg = colors_utils.darken(colors.yellow, 0.2, layer0) },
        RenderMarkdownH4Bg = { bg = colors_utils.darken(colors.green, 0.2, layer0) },
        RenderMarkdownH5Bg = { bg = colors_utils.darken(colors.sapphire, 0.2, layer0) },
        RenderMarkdownH6Bg = { bg = colors_utils.darken(colors.lavender, 0.2, layer0) },

        RenderMarkdownInlineHighlight = {
          fg = colors.rosewater,
          bg = colors_utils.darken(colors.rosewater, 0.2, layer0),
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
