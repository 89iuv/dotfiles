return {
  "catppuccin/nvim",
  enabled = true,
  opts = {
    term_colors = true,
    integrations = {
      barbar = true,
      fidget = true,
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
        NormalFloat = { fg = colors.text, bg = layer2 },
        FloatBorder = { fg = colors.surface2, bg = layer2 },
        FloatTitle = { fg = colors.subtext1, bg = layer2 },

        WinBar = { fg = colors.overlay0, bg = colors.mantle },
        WinSeparator = { fg = colors.surface2, bg = layer1 },
        StatusLine = { bg = layer4 },

        LineNr = { fg = colors.surface2 },
        Folded = { fg = colors.blue, bg = colors.surface0 },

        -- barbar
        BufferOffset = { fg = colors.lavender, bg = layer2 },
        BufferScrollArrow = { fg = colors.surface2, bg = colors.mantle },
        BufferTabpageFill = { fg = layer4, bg = layer2 },

        -- barbar current
        BufferCurrent = { bg = layer0, fg = colors.lavender, style = { "bold" } },
        BufferCurrentMod = { bg = layer0, fg = colors.lavender },
        BufferCurrentModBtn = { bg = layer0, fg = colors.peach },
        BufferCurrentBtn = { bg = layer0, fg = colors.red },
        BufferCurrentSign = { bg = layer0, fg = colors.lavender },

        -- barbar visible
        BufferVisible = { bg = layer2, fg = colors.subtext1 },
        BufferVisibleMod = { bg = layer2, fg = colors.subtext1 },
        BufferVisibleModBtn = { bg = layer2, fg = colors.peach },
        BufferVisibleBtn = { bg = layer2, fg = colors.overlay2 },
        BufferVisibleSign = { bg = layer2, fg = colors.surface2 },

        BufferVisibleError = { bg = layer2, fg = colors.red },
        BufferVisibleWarn = { bg = layer2, fg = colors.yellow },
        BufferVisibleInfo = { bg = layer2, fg = colors.sky },
        BufferVisibleHint = { bg = layer2, fg = colors.teal },

        -- barbar inactive
        BufferInactive = { bg = layer2, fg = colors.surface2 },
        BufferInactiveMod = { bg = layer2, fg = colors.surface2 },
        BufferInactiveModBtn = { bg = layer2, fg = colors.peach },
        BufferInactiveBtn = { bg = layer2, fg = colors.overlay2 },
        BufferInactiveSign = { bg = layer2, fg = colors.surface2 },

        BufferInactiveError = { bg = layer2, fg = colors.red },
        BufferInactiveWarn = { bg = layer2, fg = colors.yellow },
        BufferInactiveInfo = { bg = layer2, fg = colors.sky },
        BufferInactiveHint = { bg = layer2, fg = colors.teal },

        -- neotree
        NeoTreeNormal = { bg = layer2 },
        NeoTreeNormalNC = { bg = layer2 },

        -- NeoTreeWinSeparator = { fg = layer0, bg = layer0 },
        NeoTreeWinSeparator = { link = "WinSeparator" },
        NeoTreeIndentMarker = { link = "IblIndent" },
        NeoTreeExpander = { link = "IblIndent" },

        -- indent blankline
        IblIndent = { fg = colors.surface0 },

        -- mini indent scope
        MiniIndentscopeSymbol = { fg = colors.overlay0 },

        -- virtual column
        VirtColumn = { fg = colors.surface0 },

        -- show keys
        SkActive = { fg = layer4, bg = colors.lavender },

        -- iluminate
        IlluminatedWordText = { bg = colors.surface1 },
        IlluminatedWordRead = { bg = colors.surface1 },
        IlluminatedWordWrite = { bg = colors.surface1 },

        -- blink_cmp
        BlinkCmpMenu = { bg = layer1 },
        BlinkCmpMenuBorder = { fg = colors.surface2, bg = layer1 },
        BlinkCmpMenuSelection = { bg = colors.surface0, style = { "bold" } },

        BlinkCmpDoc = { bg = layer1 },
        BlinkCmpDocBorder = { fg = colors.surface2, bg = layer1 },
        BlinkCmpDocSeparator = { fg = colors.surface2, bg = layer1 },

        BlinkCmpSignatureHelp = { bg = layer1 },
        BlinkCmpSignatureHelpBorder = { fg = colors.surface2, bg = layer1 },

        -- fidget
        FidgetNormal = { fg = colors.subtext0, bg = layer3 },
        FidgetBorder = { fg = colors.overlay2, bg = layer3 },

        -- incline
        InclineNormal = { fg = colors.subtext0, bg = layer3 },
        InclineNormalNC = { fg = colors.subtext0, bg = layer3 },
        InclineSeparator = { fg = colors.surface2, bg = layer3 },

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
        SnacksWinBar = { fg = colors.lavender, bg = colors.mantle },

        -- trouble
        TroubleNormal = { link = "NormalFloat" },
        TroubleNormalNc = { link = "TroubleNormal" },

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

        -- treesitter
        ["@string.special.url"] = { fg = colors.rosewater, sp = colors.rosewater, style = { "italic", "underline" } },
      }
    end,
  },
}
