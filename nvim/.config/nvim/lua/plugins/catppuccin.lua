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

        -- barbar
        BufferOffset = { fg = colors.lavender, bg = colors.mantle },
        BufferScrollArrow = { fg = colors.overlay2, bg = colors.mantle },
        BufferTabpageFill = { fg = colors.crust, bg = colors.crust },

        -- barbar current
        BufferCurrent = { bg = colors.base, fg = colors.lavender, style = { "bold" } },
        BufferCurrentMod = { bg = colors.base, fg = colors.lavender },
        BufferCurrentModBtn = { bg = colors.base, fg = colors.peach },
        BufferCurrentBtn= { bg = colors.base, fg = colors.red },
        BufferCurrentSign = { bg = colors.base, fg = colors.lavender },

        -- barbar visible
        BufferVisible = { bg = colors.mantle, fg = colors.subtext1 },
        BufferVisibleMod = { bg = colors.mantle, fg = colors.subtext1 },
        BufferVisibleModBtn = { bg = colors.mantle, fg = colors.peach },
        BufferVisibleBtn = { bg = colors.mantle, fg = colors.red },
        BufferVisibleSign = { bg = colors.mantle, fg = colors.overlay2 },

        BufferVisibleError = { bg = colors.mantle, fg = colors.red },
        BufferVisibleWarn = { bg = colors.mantle, fg = colors.yellow },
        BufferVisibleInfo = { bg = colors.mantle, fg = colors.sky },
        BufferVisibleHint = { bg = colors.mantle, fg = colors.teal },

        -- barbar inactive
        BufferInactive = { bg = colors.mantle, fg = colors.overlay0 },
        BufferInactiveMod = { bg = colors.mantle, fg = colors.overlay0 },
        BufferInactiveModBtn = { bg = colors.mantle, fg = colors.peach },
        BufferInactiveBtn = { bg = colors.mantle, fg = colors.red },
        BufferInactiveSign = { bg = colors.mantle, fg = colors.overlay2 },

        BufferInactiveError = { bg = colors.mantle, fg = colors.red },
        BufferInactiveWarn = { bg = colors.mantle, fg = colors.yellow },
        BufferInactiveInfo = { bg = colors.mantle, fg = colors.sky },
        BufferInactiveHint = { bg = colors.mantle, fg = colors.teal },

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

        -- show keys
        SkActive = { fg = colors.crust, bg = colors.lavender },

        -- iluminate
        IlluminatedWordText = { bg = colors.surface1 },
        IlluminatedWordRead = { bg = colors.surface1 },
        IlluminatedWordWrite = { bg = colors.surface1 },

        -- blink_cmp
        BlinkCmpSource = { link = "PmenuSelect" },
        BlinkCmpLabelDescription = { link = "PmenuSelect" },

        BlinkCmpDocBorder = { link = "FloatBorder" },

        -- fidget
        FidgetNormal = { fg = colors.subtext0, bg = colors_utils.darken(colors.mantle, 0.4, colors.crust) },
        FidgetBorder = { fg = colors.overlay2, bg = colors_utils.darken(colors.mantle, 0.4, colors.crust) },

        -- incline
        InclineNormal = { fg = colors.subtext0, bg = colors_utils.darken(colors.mantle, 0.4, colors.crust) },
        InclineNormalNC = { fg = colors.subtext0, bg = colors_utils.darken(colors.mantle, 0.4, colors.crust) },
        InclineSeparator = { fg = colors.overlay2, bg = colors_utils.darken(colors.mantle, 0.4, colors.crust) },

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
