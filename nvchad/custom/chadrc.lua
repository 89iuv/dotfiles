---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "catppuccin",
  theme_toggle = { "catppuccin", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,

  statusline = {
    theme = "default", -- default/vscode/vscode_colored/minimal

    -- default/round/block/arrow (separators work only for "default" statusline theme;
    -- round and block will work for the minimal theme only)
    separator_style = "block",
    overriden_modules = nil,
  },

  tabufline = {
    overriden_modules = function(modules)
      modules[4] = (function()
        local CloseAllBufsBtn = "%@TbCloseAllBufs@%#TbLineCloseAllBufsBtn#" .. " 󰅖 " .. "%X"
        return CloseAllBufsBtn
      end)()

    end,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
