local colors = require("catppuccin.palettes").get_palette()

local mode_colors = {
	["n"] = { "NORMAL", colors.lavender },
	["no"] = { "N-PENDING", colors.lavender },
	["i"] = { "INSERT", colors.green },
	["ic"] = { "INSERT", colors.green },
	["t"] = { "TERMINAL", colors.green },
	["v"] = { "VISUAL", colors.flamingo },
	["V"] = { "V-LINE", colors.flamingo },
	[""] = { "V-BLOCK", colors.flamingo },
	["R"] = { "REPLACE", colors.maroon },
	["Rv"] = { "V-REPLACE", colors.maroon },
	["s"] = { "SELECT", colors.maroon },
	["S"] = { "S-LINE", colors.maroon },
	[""] = { "S-BLOCK", colors.maroon },
	["c"] = { "COMMAND", colors.peach },
	["cv"] = { "COMMAND", colors.peach },
	["ce"] = { "COMMAND", colors.peach },
	["r"] = { "PROMPT", colors.teal },
	["rm"] = { "MORE", colors.teal },
	["r?"] = { "CONFIRM", colors.mauve },
	["!"] = { "SHELL", colors.green },
}

local separator = {
  right = "",
  left = ""
}

-- helpers
local function any_git_changes()
  local gst = vim.b.gitsigns_status_dict -- git stats
  if gst then
   if gst["added"] and gst["added"] > 0
      or gst["removed"] and gst["removed"] > 0
      or gst["changed"] and gst["changed"] > 0
      then
        return true
    end
  end
  return false
end

-- statusline settings
local components = {
  active = {},
  inactive = {}
}

-- Insert two sections (left and right) for the active statusline
table.insert(components.active, {})
table.insert(components.active, {})

-- Insert a component that will be on the left side of the statusline
table.insert(components.active[1], {
    provider = ' ',
    hl = function()
      return {
        bg = mode_colors[vim.fn.mode()][2],
      }
    end
})
table.insert(components.active[1], {
  provider = 'vi_mode',
  hl = function()
    return {
      name = require('feline.providers.vi_mode').get_mode_highlight_name(),
      bg = mode_colors[vim.fn.mode()][2],
      fg = colors.base,
      style = 'bold'
    }
  end,
  -- Uncomment the next line to disable icons for this component and use the mode name instead
  -- icon = ''
})
table.insert(components.active[1], {
  provider = 'vi_mode',
  hl = function()
    return {
      name = require('feline.providers.vi_mode').get_mode_highlight_name(),
      bg = mode_colors[vim.fn.mode()][2],
      fg = colors.base,
      style = 'bold'
    }
  end,
  -- Uncomment the next line to disable icons for this component and use the mode name instead
  icon = ''
})
table.insert(components.active[1], {
    provider = ' ' .. separator.right,
    hl = function()
      return {
        fg = colors.surface1,
        bg = mode_colors[vim.fn.mode()][2],
      }
    end
})
table.insert(components.active[1], {
  provider = {
        name = 'file_info',
        opts = {
            type = 'relative'
        },
      },
    hl = { fg = colors.text, bg = colors.surface1 },
    left_sep = {str = ' ', hl = { bg = colors.surface1 }},
    right_sep = {str = ' ' .. separator.right, hl = { fg = colors.surface0, bg = colors.surface1 }},
})
table.insert(components.active[1], {
  provider = "",
  hl = { fg = colors.surface0, bg = colors.surface0 },
})

-- Insert a component that will be on the right side of the statusline
table.insert(components.active[2], {
    provider = 'search_count',
    hl = { fg = colors.subtext0, bg = colors.surface0 },
    right_sep = {str = ' ', hl = { bg = colors.surface0 }},
})

table.insert(components.active[2], {
    provider = 'line_percentage',
    hl = { fg = colors.subtext0, bg = colors.surface0 },
    right_sep = {str = ' ', hl = { bg = colors.surface0 }},
})

table.insert(components.active[2], {
    provider = 'position',
    hl = { fg = colors.subtext0, bg = colors.surface0 },
    right_sep = {str = ' ', hl = { bg = colors.surface0 }},
})

table.insert(components.active[2], {
    provider = function()
      return (require('feline.providers.file').file_format()
      .. " " .. require('feline.providers.file').file_encoding()):lower()
    end,
    hl = { fg = colors.subtext0, bg = colors.surface0 },
    right_sep = {str = ' ', hl = { bg = colors.surface0 }}
})

table.insert(components.active[2], {
  provider = separator.left,
  hl = { fg = colors.surface1, bg = colors.surface0 },
  enabled = any_git_changes
})
table.insert(components.active[2], {
    provider = 'git_diff_added',
    hl = { fg = colors.green, bg = colors.surface1 },
    right_sep = {str = ' ', hl = { fg = colors.surface1, bg = colors.surface1 }},
    icon = " + "
})
table.insert(components.active[2], {
    provider = 'git_diff_changed',
    hl = { fg = colors.yellow, bg = colors.surface1 },
    right_sep = {str = ' ', hl = { fg = colors.surface1, bg = colors.surface1 }},
    icon = "~ "
})
table.insert(components.active[2], {
    provider = 'git_diff_removed',
    hl = { fg = colors.red, bg = colors.surface1 },
    right_sep = {str = ' ', hl = { fg = colors.surface2, bg = colors.surface1 }},
    icon = "- "
})

table.insert(components.active[2], {
  provider = separator.left,
  hl = { fg = colors.green, bg = colors.surface1 },
  enabled = require('feline.providers.git').git_info_exists
})
table.insert(components.active[2], {
    provider = 'git_branch',
    hl = { fg = colors.base, bg = colors.green },
    left_sep = {str = ' ', hl = { bg = colors.green }},
    right_sep = {str = ' ', hl = { bg = colors.green }},
})

-- copy active components in inactive components
components.inactive = components.active

require('feline').setup({
	components = components,
})

-- WinBar Settings
local disabled = {
  filetype = {
    "^NvimTree$",
    "^help$",
    "^packer$",
    "^mason$",
  },
  buftype = {},
  bufname = {}
}

-- Return true if any pattern in tbl matches provided value
local function find_pattern_match(tbl, val)
    return tbl
        and next(vim.tbl_filter(function(pattern)
            return val:match(pattern)
        end, tbl))
end

local function is_disabled(dis)
    local buftype = vim.bo.buftype
    local filetype = vim.bo.filetype
    local bufname = vim.api.nvim_buf_get_name(0)

    -- workaround for floating windows
    if buftype == "nofile"
      and filetype == ""
      and bufname == ""
      then
        return true
    end

    return find_pattern_match(dis.filetype, filetype)
        or find_pattern_match(dis.buftype, buftype)
        or find_pattern_match(dis.bufname, bufname)

end

local components = {
    active = {},
    inactive = {}
}

-- Insert two sections (left and right) for the active statusline
table.insert(components.active, {})
table.insert(components.active, {})

-- Insert a component that will be on the right side of the statusline
table.insert(components.active[2], {
    provider = 'diagnostic_errors',
    hl = { fg = colors.red, bg = colors.base }
})
table.insert(components.active[2], {
    provider = 'diagnostic_warnings',
    hl = { fg = colors.yellow, bg = colors.base }
})
table.insert(components.active[2], {
    provider = 'diagnostic_info',
    hl = { fg = colors.sky, bg = colors.base }
})
table.insert(components.active[2], {
    provider = 'diagnostic_hints',
    hl = { fg = colors.teal, bg = colors.base }
})
table.insert(components.active[2], {
    provider = 'lsp_client_names',
    hl = { fg = colors.text, bg = colors.base },
    left_sep = { str = " ", hl = { bg = colors.base }}
})
table.insert(components.active[2], {
    provider = ' ',
    hl = { bg = colors.base }
})

-- copy active components in inactive components
components.inactive = components.active

require('feline').winbar.setup({
	components = components,
})

vim.o.winbar = nil

vim.api.nvim_create_autocmd({"BufWinEnter"}, {
  pattern = "*",
  callback = function()
    if is_disabled(disabled) then
      vim.wo.winbar=nil
    else
      vim.wo.winbar = "%{%v:lua.require'feline'.generate_winbar()%}"
    end

  end
})

