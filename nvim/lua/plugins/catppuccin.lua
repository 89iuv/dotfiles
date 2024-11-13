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

        WinSeparator = { fg = colors.crust, bg = colors.base },

        -- lsp
        -- remove reference highlight as there is no way to disable it
        -- this is taken care of by illuminate plugin
        LspReferenceText = { link = "NONE" },
        LspReferenceRead = { link = "NONE" },
        LspReferenceWrite = { link = "NONE" },

        -- neotree
        NeoTreeWinSeparator = { link = "WinSeparator" },

        -- mini
        MiniIndentscopeSymbol = { fg = colors.surface2 },

        -- telescope
        TelescopeNormal = { link = "NormalFloat" },

        -- trouble
        TroubleNormal = { link = "Normal" },
        TroubleNormalNc = { link = "TroubleNormal" },

        -- snacks
        SnacksNormal = { link = "NormalFloat" },
        SnacksNormalNC = { link = "SnacksNormal" },
        SnacksWinBar = { fg = colors.surface2 },
        SnacksWinBarNC = { fg = colors.surface0 },
      }
    end,
  },
}
