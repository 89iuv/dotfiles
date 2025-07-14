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
      local layer0 = colors.base
      local layer1 = colors_utils.blend(colors.base, colors.mantle, 0.5)
      local layer2 = colors.mantle
      local layer3 = colors_utils.blend(colors.mantle, colors.crust, 0.5)
      local layer4 = colors.crust

      return {
        -- catppuccin
        NormalSide = { fg = colors.text, bg = layer2 },
        SideWinbar = { fg = colors.lavender, bg = layer2 },

        NormalPopup = { fg = colors.text, bg = layer1 },
        PopupBorder = { fg = colors.subtext0, bg = layer1 },
        PopupTitle = { fg = colors.lavender, bg = layer1 },

        NormalFloat = { fg = colors.text, bg = layer2 },
        FloatBorder = { fg = colors.subtext0, bg = layer2 },
        FloatTitle = { fg = colors.lavender, bg = layer2 },

        WinSeparator = { fg = colors.overlay0, bg = layer1 },
        StatusLine = { bg = layer3 },
        Folded = { fg = colors.blue, bg = colors.surface0 },

        -- bufferline
        BufferlineProjectExplorer = { link = "SideWinbar" },
        BufferlineSideBar = { link = "SideWinbar" },

        BufferLineSeparator = { fg = colors.surface2, bg = layer2 },
        BufferLineOffsetSeparator = { link = "WinSeparator" },

        BufferLineIndicatorSelected = { fg = colors.lavender, bg = layer0 },
        BufferLineTruncMarker = { fg = colors.surface2, bg = layer3 },
        BufferLineFill = { bg = layer3 },

        BufferLineBuffer = { fg = colors.overlay2, bg = layer2 },
        BufferLineError = { link = "BufferLineBuffer" },
        BufferLineWarning = { link = "BufferLineBuffer" },
        BufferLineInfo = { link = "BufferLineBuffer" },
        BufferLineHint = { link = "BufferLineBuffer" },

        BufferLineBufferSelected = { fg = colors.lavender, bg = layer0, style = { "bold" } },
        BufferLineErrorSelected = { link = "BufferLineBufferSelected" },
        BufferLineWarningSelected = { link = "BufferLineBufferSelected" },
        BufferLineHintSelected = { link = "BufferLineBufferSelected" },
        BufferLineInfoSelected = { link = "BufferLineBufferSelected" },

        BufferLineBufferVisible = { fg = colors.text, bg = layer2 },
        BufferLineErrorVisible = { link = "BufferLineBufferVisible" },
        BufferLineWarningVisible = { link = "BufferLineBufferVisible" },
        BufferLineInfoVisible = { link = "BufferLineBufferVisible" },
        BufferLineHintVisible = { link = "BufferLineBufferVisible" },

        BufferLineErrorDiagnostic = { bg = layer2, fg = colors_utils.darken(colors.red, 0.75, layer2) },
        BufferLineWarningDiagnostic = { bg = layer2, fg = colors_utils.darken(colors.yellow, 0.75, layer2) },
        BufferLineInfoDiagnostic = { bg = layer2, fg = colors_utils.darken(colors.sky, 0.75, layer2) },
        BufferLineHintDiagnostic = { bg = layer2, fg = colors_utils.darken(colors.teal, 0.75, layer2) },

        -- neo-tree
        NeoTreeNormal = { link = "NormalSide" },
        NeoTreeNormalNC = { link = "NormalSide" },

        NeoTreeWinSeparator = { link = "WinSeparator" },
        NeoTreeIndentMarker = { link = "LineNr" },
        NeoTreeExpander = { link = "LineNr" },

        NeoTreeDotfile = { fg = colors.overlay0 },
        NeoTreeProjectName = { fg = colors.blue },
        NeoTreeProjectPath = { link = "NeoTreeDotfile"  },

        -- which key
        WhichKey = { link = "NormalPopup" },
        WhichKeyBorder = { link = "PopupBorder" },
        WhichKeyTitle = { link = "PopupTitle" },
        WhichKeyNormal = { link = "NormalPopup" },

        -- virtual column
        VirtColumn = { fg = colors.surface0 },

        -- show keys
        SkActive = { fg = layer4, bg = colors.lavender },

        -- illuminate
        IlluminatedWordText = { bg = colors.surface1 },
        IlluminatedWordRead = { bg = colors.surface1 },
        IlluminatedWordWrite = { bg = colors.surface1 },

        -- blink
        BlinkCmpMenu = { bg = layer1 },
        BlinkCmpMenuBorder = { fg = colors.surface2, bg = layer1 },
        BlinkCmpMenuSelection = { bg = colors.surface0, style = { "bold" } },

        BlinkCmpDoc = { bg = layer1 },
        BlinkCmpDocBorder = { fg = colors.surface2, bg = layer1 },
        BlinkCmpDocSeparator = { fg = colors.surface2, bg = layer1 },

        BlinkCmpSignatureHelp = { bg = layer2 },
        BlinkCmpSignatureHelpBorder = { fg = colors.surface2, bg = layer2 },

        -- blink completion dictionary
        BlinkCmpKindDict = { fg = colors.teal },

        -- fidget
        FidgetNormal = { fg = colors.subtext0, bg = layer3 },
        FidgetBorder = { fg = colors.overlay2, bg = layer3 },

        -- incline
        InclineNormal = { fg = colors.subtext0, bg = layer3 },
        InclineNormalNC = { link = "InclineNormal" },

        InclineSeparator = { fg = colors.overlay0, bg = layer3 },

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

        NoiceMini = { bg = layer3 },

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

        -- snacks input icon
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

        -- Tree-sitter
        ["@string.special.url"] = { fg = colors.rosewater, sp = colors.rosewater, style = { "italic", "underline" } },
      }
    end,
  },
}
