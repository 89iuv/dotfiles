local get_feline_statusline = function(opts)
  local C = require('catppuccin.palettes').get_palette()
  local lsp = require 'feline.providers.lsp'

  local config = {
    left_separator = '',
    right_separator = '',
    mode_icon = '',
    dir = '󰉖',
    file = '󰈙',
    lsp = {
      icons = {
        linter = '󰸥',
        server = '󰅡',
        error = '',
        warning = '',
        info = '',
        hint = '',
      },
      exclude = {},
      server_to_name_map = {},
      update_in_insert = false,
    },
    git = {
      branch = '',
      added = '',
      changed = '',
      removed = '',
    },
  }

  ---@diagnostic disable-next-line: redefined-local
  local config = vim.tbl_deep_extend('force', config, opts)

  local mode_colors = {
    ['n'] = { 'NORMAL', C.lavender },
    ['no'] = { 'N-PENDING', C.lavender },
    ['i'] = { 'INSERT', C.green },
    ['ic'] = { 'INSERT', C.green },
    ['t'] = { 'TERMINAL', C.green },
    ['v'] = { 'VISUAL', C.flamingo },
    ['V'] = { 'V-LINE', C.flamingo },
    [''] = { 'V-BLOCK', C.flamingo },
    ['R'] = { 'REPLACE', C.maroon },
    ['Rv'] = { 'V-REPLACE', C.maroon },
    ['s'] = { 'SELECT', C.maroon },
    ['S'] = { 'S-LINE', C.maroon },
    [''] = { 'S-BLOCK', C.maroon },
    ['c'] = { 'COMMAND', C.peach },
    ['cv'] = { 'COMMAND', C.peach },
    ['ce'] = { 'COMMAND', C.peach },
    ['r'] = { 'PROMPT', C.teal },
    ['rm'] = { 'MORE', C.teal },
    ['r?'] = { 'CONFIRM', C.mauve },
    ['!'] = { 'SHELL', C.green },
  }

  -- helpers

  local function is_insert() -- insert or replace
    local mode = vim.api.nvim_get_mode().mode
    return mode == 'i' or mode == 'ic' or mode == 'ix' or mode == 'R' or mode == 'Rc' or mode == 'Rx'
  end

  local is_value_in_array = function(value, array)
    for _, v in ipairs(array) do
      if v == value then
        return true
      end
    end
    return false
  end

  local create_highlight = function(fg, bg)
    return {
      fg = fg,
      bg = bg,
    }
  end

  local create_separator = function(fg, bg, sep)
    return {
      str = sep,
      hl = create_highlight(fg, bg),
    }
  end

  local create_icon = function(fg, bg, icon)
    return {
      str = icon,
      hl = create_highlight(fg, bg),
    }
  end

  -- components
  local components_left = {}

  table.insert(components_left, {
    provider = ' ' .. config.mode_icon,
    hl = function()
      return {
        fg = C.mantle,
        bg = mode_colors[vim.fn.mode()][2],
      }
    end,
  })

  table.insert(components_left, {
    provider = function()
      return ' ' .. mode_colors[vim.fn.mode()][1] .. ' '
    end,
    hl = function()
      return {
        fg = C.mantle,
        bg = mode_colors[vim.fn.mode()][2],
        style = 'bold',
      }
    end,
  })

  table.insert(components_left, {
    provider = config.right_separator,
    hl = function()
      return {
        fg = mode_colors[vim.fn.mode()][2],
        bg = C.overlay1,
      }
    end,
  })

  table.insert(components_left, {
    provider = config.right_separator,
    hl = create_highlight(C.overlay1, C.surface0),
  })

  table.insert(components_left, {
    provider = function()
      local filename = vim.fn.expand '%:t'
      local extension = vim.fn.expand '%:e'
      local present, icons = pcall(require, 'nvim-web-devicons')
      local icon = present and icons.get_icon(filename, extension) or config.file
      return ' ' .. icon .. ' ' .. filename .. ' '
    end,
    hl = create_highlight(C.text, C.surface0),
    right_sep = create_separator(C.surface0, C.crust, config.right_separator .. ' '),
  })

  table.insert(components_left, {
    provider = 'git_branch',
    truncate_hide = true,
    hl = create_highlight(C.subtext1, C.crust),
    icon = config.git.branch .. ' ',
    right_sep = create_separator(C.crust, C.crust, ' '),
  })

  table.insert(components_left, {
    provider = 'git_diff_added',
    hl = create_highlight(C.green, C.crust),
    icon = create_icon(C.green, C.crust, config.git.added .. ' '),
    right_sep = create_separator(C.crust, C.crust, ' '),
  })

  table.insert(components_left, {
    provider = 'git_diff_changed',
    hl = create_highlight(C.yellow, C.crust),
    icon = create_icon(C.yellow, C.crust, config.git.changed .. ' '),
    right_sep = create_separator(C.crust, C.crust, ' '),
  })

  table.insert(components_left, {
    provider = 'git_diff_removed',
    hl = create_highlight(C.red, C.crust),
    icon = create_icon(C.red, C.crust, config.git.removed .. ' '),
    right_sep = create_separator(C.crust, C.crust, ' '),
  })

  table.insert(components_left, {
    hl = create_highlight(C.crust, C.crust),
  })

  local components_right = {}

  table.insert(components_right, {
    hl = create_highlight(C.crust, C.crust),
  })

  table.insert(components_right, {
    provider = 'diagnostic_hints',
    enabled = function()
      local is_lsp_enable = lsp.diagnostics_exist(vim.diagnostic.severity.HINT)
      if config.lsp.update_in_insert then
        return is_lsp_enable
      end
      if is_insert() then
        return false
      end
      return is_lsp_enable
    end,
    hl = create_highlight(C.teal, C.crust),
    icon = config.lsp.icons.hint .. ' ',
    right_sep = create_separator(C.crust, C.crust, ' '),
  })

  table.insert(components_right, {
    provider = 'diagnostic_info',
    enabled = function()
      local is_lsp_enable = lsp.diagnostics_exist(vim.diagnostic.severity.INFO)
      if config.lsp.update_in_insert then
        return is_lsp_enable
      end
      if is_insert() then
        return false
      end
      return is_lsp_enable
    end,
    hl = create_highlight(C.blue, C.crust),
    icon = config.lsp.icons.info .. ' ',
    right_sep = create_separator(C.crust, C.crust, ' '),
  })

  table.insert(components_right, {
    provider = 'diagnostic_warnings',
    enabled = function()
      local is_lsp_enable = lsp.diagnostics_exist(vim.diagnostic.severity.WARN)
      if config.lsp.update_in_insert then
        return is_lsp_enable
      end
      if is_insert() then
        return false
      end
      return is_lsp_enable
    end,
    hl = create_highlight(C.yellow, C.crust),
    icon = config.lsp.icons.warning .. ' ',
    right_sep = create_separator(C.crust, C.crust, ' '),
  })

  table.insert(components_right, {
    provider = 'diagnostic_errors',
    enabled = function()
      local is_lsp_enable = lsp.diagnostics_exist(vim.diagnostic.severity.ERROR)
      if config.lsp.update_in_insert then
        return is_lsp_enable
      end
      if is_insert() then
        return false
      end
      return is_lsp_enable
    end,
    hl = create_highlight(C.red, C.crust),
    icon = config.lsp.icons.error .. ' ',
    right_sep = create_separator(C.crust, C.crust, ' '),
  })

  table.insert(components_right, {
    provider = function()
      local active_clients = vim.lsp.get_clients { bufnr = 0 }

      table.sort(active_clients, function(a, b)
        return a.name < b.name
      end)

      local index = 0
      local lsp_names = ''
      for _, lsp_config in ipairs(active_clients) do
        if is_value_in_array(lsp_config.name, config.lsp.exclude) then
          goto continue
        end

        local lsp_name = config.lsp.server_to_name_map[lsp_config.name] == nil and lsp_config.name or config.lsp.server_to_name_map[lsp_config.name]

        index = index + 1
        if index == 1 then
          lsp_names = config.lsp.icons.server .. ' ' .. lsp_name
        else
          lsp_names = lsp_names .. ', ' .. lsp_name
        end

        ::continue::
      end

      return lsp_names
    end,
    truncate_hide = true,
    hl = create_highlight(C.subtext1, C.crust),
    right_sep = create_separator(C.crust, C.crust, ' '),
  })

  table.insert(components_right, {
    provider = function()
      local linters = require('lint').linters_by_ft[vim.bo.filetype] or {}
      if #linters == 0 then
        return ''
      end
      return config.lsp.icons.linter .. ' ' .. table.concat(linters, ', ')
    end,
    truncate_hide = true,
    hl = create_highlight(C.subtext1, C.crust),
    right_sep = create_separator(C.crust, C.crust, ' '),
  })

  table.insert(components_right, {
    provider = function()
      local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
      return ' ' .. dir_name .. ' '
    end,
    truncate_hide = true,
    hl = create_highlight(C.text, C.surface0),
    icon = create_icon(C.surface0, C.maroon, config.dir .. ' '),
    left_sep = create_separator(C.maroon, C.crust, config.left_separator),
  })

  table.insert(components_right, {
    provider = function()
      local current_line = vim.fn.line '.'
      local total_line = vim.fn.line '$'

      if current_line == 1 then
        return ' Top '
      elseif current_line == vim.fn.line '$' then
        return ' Bot '
      end
      local result, _ = math.modf((current_line / total_line) * 100)
      return ' ' .. result .. '%% '
    end,
    hl = create_highlight(C.text, C.surface0),
    icon = create_icon(C.surface0, C.green, config.file .. ' '),
    left_sep = create_separator(C.green, C.surface0, config.left_separator),
  })

  local M = {
    active = {
      components_left,
      {},
      components_right,
    },
  }

  return M
end

return {
  'freddiehaddad/feline.nvim',
  config = function()
    local force_inactive = {
      filetypes = {},
      buftypes = {},
      bufnames = {},
    }

    local opts = {
      lsp = {
        -- exclude = { 'GitHub Copilot' },
        server_to_name_map = {
          ['GitHub Copilot'] = 'copilot',
        },
        update_in_insert = true,
      },
    }

    require('feline').setup {
      components = get_feline_statusline(opts),
      force_inactive = force_inactive,
    }

    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = '*',
      callback = function()
        package.loaded['feline'] = nil
        package.loaded['catppuccin.groups.integrations.feline'] = nil

        require('feline').setup {
          components = get_feline_statusline(opts),
          force_inactive = force_inactive,
        }
      end,
    })
  end,
}
