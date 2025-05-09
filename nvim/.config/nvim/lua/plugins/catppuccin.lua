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
        FloatBorder = { fg = colors.overlay2, bg = colors.mantle },
        FloatTitle = { fg = colors.subtext0, bg = colors.mantle },

        WinBar = { fg = colors.overlay0, bg = colors.mantle },
        WinSeparator = { fg = colors.overlay2, bg = colors.base },
        StatusLine = { bg = colors.crust },

        LineNr = { fg = colors.surface2 },
        Folded = { fg = colors.blue, bg = colors.surface0 },

        -- bufferline
        BufferlineProjectExplorer = { fg = colors.lavender, bg = colors.base },

        BufferLineSeparator = { fg = colors.crust, bg = colors.mantle },
        BufferLineOffsetSeparator = { link = "WinSeparator" },

        BufferLineIndicatorSelected = { fg = colors.lavender, bg = colors.base },
        BufferLineTruncMarker = { fg = colors.overlay0, bg = colors.crust },
        BufferLineFill = { bg = colors.crust },

        BufferLineHint = { link = "BufferLineBuffer" },
        BufferLineInfo = { link = "BufferLineBuffer" },
        BufferLineWarning = { link = "BufferLineBuffer" },
        BufferLineError = { link = "BufferLineBuffer" },

        BufferLineBufferSelected = { fg = colors.lavender, bg = colors.base, style = { "bold" } },
        BufferLineHintSelected = { link = "BufferLineBufferSelected" },
        BufferLineInfoSelected = { link = "BufferLineBufferSelected" },
        BufferLineWarningSelected = { link = "BufferLineBufferSelected" },
        BufferLineErrorSelected = { link = "BufferLineBufferSelected" },

        BufferLineBufferVisible = { fg = colors.lavender, bg = colors.mantle },
        BufferLineHintVisible = { link = "BufferLineBufferVisible" },
        BufferLineInfoVisible = { link = "BufferLineBufferVisible" },
        BufferLineWarningVisible = { link = "BufferLineBufferVisible" },
        BufferLineErrorVisible = { link = "BufferLineBufferVisible" },

        -- neotree
        NeoTreeWinSeparator = { link = "WinSeparator" },
        NeoTreeIndentMarker = { link = "IblIndent" },
        NeoTreeExpander = { link = "IblIndent" },

        -- indent blankline
        IblIndent = { fg = colors.surface0 },

        -- mini indent scope
        MiniIndentscopeSymbol = { fg = colors.overlay0 },

        -- virtual column
        VirtColumn = { fg = colors.surface0 },

        -- iluminate
        IlluminatedWordText = { bg = colors.surface1 },
        IlluminatedWordRead = { bg = colors.surface1 },
        IlluminatedWordWrite = { bg = colors.surface1 },

        -- blink_cmp
        BlinkCmpSource = { link = "PmenuSelect" },
        BlinkCmpLabelDescription = { link = "PmenuSelect" },

        BlinkCmpDocBorder = { link = "FloatBorder" },

        -- fidget
        FidgetNormal = { link = "NormalFloat" },
        FidgetBorder = { link = "FidgetNormal" },

        -- incline
        InclineNormal = { fg = colors.subtext0, bg = colors.crust },
        InclineNormalNC = { fg = colors.subtext0, bg = colors.crust },

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
        SnacksWinBar = { fg = colors.lavender, bg = colors.mantle },

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

        -- treesitter
        ["@string.special.url"] = { fg = colors.rosewater, sp = colors.rosewater, style = { "italic", "underline" } },
      }
    end,
  },
}
