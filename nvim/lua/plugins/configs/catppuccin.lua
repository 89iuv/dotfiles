vim.g.catppuccin_flavour = "macchiato"

local catppuccin = require'catppuccin'
-- local cp = require'catppuccin.api.colors'.get_colors() -- fetch colors with API
-- catppuccin.remap({
    -- NvimTreeEndOfBuffer = { fg = cp.black1, bg = cp.black1 },
    -- CursorLineNr = { fg = cp.white },

    -- TelescopeNormal = { bg = cp.black1 },
    -- TelescopeBorder = { bg = cp.black1 },

    -- TelescopePromptNormal = { bg = cp.black3 },
    -- TelescopePromptBorder = { fg = cp.black3, bg = cp.black3 },
    -- TelescopePromptTitle = { fg = cp.black3, bg = cp.black3 }
-- })

-- configure it
catppuccin.setup(
)

vim.cmd[[colorscheme catppuccin]]
