return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup {
      flavour = 'mocha', -- latte, frappe, macchiato, mocha
      -- flavour = "auto" -- will respect terminal's background
      background = { -- :h background
        light = 'latte',
        dark = 'mocha',
      },
      transparent_background = false, -- disables setting the background color.
      -- transparent_background = true, -- disables setting the background color.
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = 'dark',
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { 'italic' }, -- Change the style of comments
        conditionals = { 'italic' },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
      },
      color_overrides = {},
      custom_highlights = function(colors)
        return {
          FloatBorder = { fg = colors.lavender },
          NvimTreeEndOfBuffer = { fg = colors.mantle },
          -- NvimTreeIndentMarker = { fg = colors.surface0 },

          -- remove italics from diagnostics
          NvimTreeDiagnosticErrorIcon = { fg = colors.red },
          NvimTreeDiagnosticWarnIcon = { fg = colors.yellow },
          NvimTreeDiagnosticInfoIcon = { fg = colors.blue },
          NvimTreeDiagnosticHintIcon = { fg = colors.teal },

          TelescopeNormal = { link = 'NormalFloat' },
          CmpItemMenu = { fg = colors.overlay2 },
          CopilotSuggestion = { fg = colors.surface2 },
          MiniIndentscopeSymbol = { fg = colors.surface2 },
        }
      end,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = true,
        mini = {
          enabled = true,
          indentscope_color = '',
        },
        noice = true,
        indent_blankline = {
          enabled = true,
          scope_color = 'surface1',
        },
        mason = true,
        which_key = true,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    }

    vim.cmd.colorscheme 'catppuccin'
  end,
  -- lazy = false,
}
