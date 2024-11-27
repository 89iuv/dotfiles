return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    custom_highlights = function(colors)
      local colors_utils = require("catppuccin.utils.colors")
      return {
        -- nvim
        NormalFloat = { fg = colors.text, bg = colors.mantle },
        FloatBorder = { fg = colors.lavender, bg = colors.mantle },
        FloatTitle = { link = "FloatBorder" }, -- fix for which_key window title
        StatusLine = { bg = colors.crust },
        WinSeparator = { fg = colors.surface1, bg = colors.base },
        LineNr = { fg = colors.surface2 },

        -- lsp
        -- remove reference highlight as there is no way to disable it
        -- this is taken care of by illuminate plugin
        LspReferenceText = { link = "NONE" },
        LspReferenceRead = { link = "NONE" },
        LspReferenceWrite = { link = "NONE" },

        -- mini
        MiniIndentscopeSymbol = { fg = colors.overlay0 },

        -- neotree
        NeoTreeWinSeparator = { link = "WinSeparator" },
        NeoTreeIndentMarker = { link = "MiniIndentscopeSymbol" },

        -- telescope
        TelescopeNormal = { link = "NormalFloat" },

        -- trouble
        TroubleNormal = { link = "NormalFloat" },
        TroubleNormalNc = { link = "TroubleNormal" },

        -- markdown
        RenderMarkdownH1Bg = { bg = colors_utils.darken(colors.red, 0.1, colors.base) },
        RenderMarkdownH2Bg = { bg = colors_utils.darken(colors.peach, 0.1, colors.base) },
        RenderMarkdownH3Bg = { bg = colors_utils.darken(colors.yellow, 0.1, colors.base) },
        RenderMarkdownH4Bg = { bg = colors_utils.darken(colors.green, 0.1, colors.base) },
        RenderMarkdownH5Bg = { bg = colors_utils.darken(colors.sapphire, 0.1, colors.base) },
        RenderMarkdownH6Bg = { bg = colors_utils.darken(colors.lavender, 0.1, colors.base) },

        RenderMarkdownInlineHighlight = { fg = colors.crust, bg = colors_utils.darken(colors.yellow, 0.8, colors.base) },
        RenderMarkdownQuote = { fg = colors.subtext0 },

        ["@markup.strong.markdown_inline"] = { fg = colors.text, style = { "bold" } },
        ["@markup.italic.markdown_inline"] = { fg = colors.text, style = { "italic" } },

        ["@markup.quote.markdown"] = { link = "RenderMarkdownQuote" },
      }
    end,
  },
}
