return {
  "catppuccin/nvim",
  enabled = true,
  opts = {
    term_colors = true,
    integrations = {
      fidget = true,
    },
    custom_highlights = function(colors)
      local colors_utils = require("catppuccin.utils.colors")
      return {
        -- catppuccin
        NormalFloat = { fg = colors.text, bg = colors.mantle },
        FloatBorder = { fg = colors.surface2, bg = colors.mantle },
        FloatTitle = { fg = colors.overlay2, bg = colors.mantle },

        WinSeparator = { fg = colors.surface2, bg = colors.base },
        StatusLine = { bg = colors.crust },
        LineNr = { fg = colors.surface1 },

        Folded = { fg = colors.blue, bg = colors_utils.darken(colors.surface0, 0.5, colors.base) },

        -- bufferline
        BufferlineProjectExplorer = { fg = colors.subtext0, bg = colors.base },

        BufferLineIndicatorSelected = { fg = colors.lavender },
        BufferLineBufferSelected = { fg = colors.text, bg = colors.base, style = { "bold", "italic" } },
        BufferLineBufferVisible = { fg = colors.subtext0, bg = colors.mantle },

        BufferLineOffsetSeparator = { link = "WinSeparator" },
        BufferLineSeparator = { fg = colors.overlay0, bg = colors.mantle },

        BufferLineTruncMarker = { fg = colors.overlay0, bg = colors.mantle },
        BufferLineFill = { bg = colors.crust },

        BufferLineError = { link = "BufferLineBuffer" },
        BufferLineErrorVisible = { link = "BufferLineBufferVisible" },
        BufferLineErrorSelected = { link = "BufferLineBufferSelected" },

        BufferLineWarning = { link = "BufferLineBuffer" },
        BufferLineWarningVisible = { link = "BufferLineBufferVisible" },
        BufferLineWarningSelected = { link = "BufferLineBufferSelected" },

        BufferLineHint = { link = "BufferLineBuffer" },
        BufferLineHintVisible = { link = "BufferLineBufferVisible" },
        BufferLineHintSelected = { link = "BufferLineBufferSelected" },

        BufferLineInfo = { link = "BufferLineBuffer" },
        BufferLineInfoVisible = { link = "BufferLineBufferVisible" },
        BufferLineInfoSelected = { link = "BufferLineBufferSelected" },

        -- neotree
        NeoTreeWinSeparator = { link = "WinSeparator" },
        NeoTreeIndentMarker = { link = "IblIndent" },
        NeoTreeExpander = { link = "IblIndent" },

        -- indent blankline
        IblIndent = { fg = colors.surface0 },

        -- mini indent scope
        MiniIndentscopeSymbol = { fg = colors.overlay0 },

        -- blink_cmp
        BlinkCmpSource = { link = "PmenuSelect" },
        BlinkCmpLabelDescription = { link = "PmenuSelect" },

        BlinkCmpDocBorder = { link = "FloatBorder" },

        -- fidget
        FidgetNormal = { link = "NormalFloat" },
        FidgetBorder = { link = "FidgetNormal" },

        -- noice
        NoiceConfirm = { link = "NormalFloat" },
        NoiceConfirmBorder = { link = "FloatBorder" },

        NoiceCmdlinePopup = { link = "NormalFloat" },
        NoiceCmdlinePopupBorder = { link = "FloatBorder" },

        NoiceCmdlinePopupTitleSearch = { link = "FloatTitle" },
        NoiceCmdlinePopupBorderSearch = { link = "FloatBorder" },

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

        -- trouble
        TroubleNormal = { link = "NormalFloat" },
        TroubleNormalNc = { link = "TroubleNormal" },

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
      }
    end,
  },
}
