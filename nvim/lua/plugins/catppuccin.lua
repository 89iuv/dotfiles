return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    custom_highlights = function(colors)
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
        ["@markup.quote.markdown"] = { link = "Normal" },
        ["@markup.raw.block.markdown"] = { link = "Normal" },
      }
    end,
  },
}
