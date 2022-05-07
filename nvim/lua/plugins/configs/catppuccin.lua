local catppuccin = require'catppuccin'
local cp = require'catppuccin.api.colors'.get_colors() -- fetch colors with API
catppuccin.remap({
    NvimTreeEndOfBuffer = { fg = cp.black1, bg = cp.black1 },
    CursorLineNr = { fg = cp.white },

    TelescopeNormal = { bg = cp.black1 },
    TelescopeBorder = { bg = cp.black1 },

    -- TelescopePromptNormal = { bg = cp.black3 },
    -- TelescopePromptBorder = { fg = cp.black3, bg = cp.black3 },
    -- TelescopePromptTitle = { fg = cp.black3, bg = cp.black3 }
})

-- configure it
catppuccin.setup({
  transparent_background = false,
  term_colors = false,
  styles = {
    comments = "italic",
    functions = "italic",
    keywords = "italic",
    strings = "NONE",
    variables = "italic",
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = "italic",
        hints = "italic",
        warnings = "italic",
        information = "italic",
      },
      underlines = {
        errors = "underline",
        hints = "underline",
        warnings = "underline",
        information = "underline",
      },
    },
    lsp_trouble = false,
    cmp = true,
    lsp_saga = false,
    gitgutter = false,
    gitsigns = true,
    telescope = true,
    nvimtree = {
      enabled = true,
      show_root = true,
      transparent_panel = false,
    },
    neotree = {
      enabled = false,
      show_root = false,
      transparent_panel = false,
    },
    which_key = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = false,
    },
    dashboard = true,
    neogit = false,
    vim_sneak = false,
    fern = false,
    barbar = false,
    bufferline = false,
    markdown = true,
    lightspeed = false,
    ts_rainbow = false,
    hop = false,
    notify = true,
    telekasten = true,
    symbols_outline = true,
  }
})

vim.cmd[[colorscheme catppuccin]]
