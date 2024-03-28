local get_feline_statusline = function()
  local C = require('catppuccin.palettes').get_palette()
  local lsp = require 'feline.providers.lsp'

  local assets = {
    left_separator = '',
    right_separator = '',
    mode_icon = '',
    dir = '󰉖',
    file = '󰈙',
    lsp = {
      server = '󰅡',
      error = ' ',
      warning = '',
      info = ' ',
      hint = '',
    },
    git = {
      branch = '',
      added = '',
      changed = '',
      removed = '',
    },
  }

  local mode_colors = {
    ['n'] = { 'NORMAL', C.lavender },
    ['no'] = { 'N-PENDING', C.lavender },
    ['i'] = { 'INSERT', C.green },
    ['ic'] = { 'INSERT', C.green },
    ['t'] = { 'TERMINAL', C.green },
    ['v'] = { 'VISUAL', C.flamingo },
    ['V'] = { 'V-LINE', C.flamingo },
    ---@diagnostic disable-next-line: duplicate-index
    [''] = { 'V-BLOCK', C.flamingo },
    ['R'] = { 'REPLACE', C.maroon },
    ['Rv'] = { 'V-REPLACE', C.maroon },
    ['s'] = { 'SELECT', C.maroon },
    ['S'] = { 'S-LINE', C.maroon },
    ---@diagnostic disable-next-line: duplicate-index
    [''] = { 'S-BLOCK', C.maroon },
    ['c'] = { 'COMMAND', C.peach },
    ['cv'] = { 'COMMAND', C.peach },
    ['ce'] = { 'COMMAND', C.peach },
    ['r'] = { 'PROMPT', C.teal },
    ['rm'] = { 'MORE', C.teal },
    ['r?'] = { 'CONFIRM', C.mauve },
    ['!'] = { 'SHELL', C.green },
  }

  -- helpers
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
    provider = ' ' .. assets.mode_icon,
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
    provider = assets.right_separator,
    hl = function()
      return {
        fg = mode_colors[vim.fn.mode()][2],
        bg = C.overlay1,
      }
    end,
  })

  table.insert(components_left, {
    provider = assets.right_separator,
    hl = create_highlight(C.overlay1, C.surface0),
  })

  table.insert(components_left, {
    provider = function()
      local filename = vim.fn.expand '%:t'
      local extension = vim.fn.expand '%:e'
      local present, icons = pcall(require, 'nvim-web-devicons')
      local icon = present and icons.get_icon(filename, extension) or assets.file
      return ' ' .. icon .. ' ' .. filename .. ' '
    end,
    hl = create_highlight(C.text, C.surface0),
    right_sep = create_separator(C.surface0, C.crust, assets.right_separator),
  })

  table.insert(components_left, {
    provider = 'git_branch',
    hl = create_highlight(C.subtext1, C.crust),
    icon = assets.git.branch .. ' ',
    left_sep = create_separator(C.crust, C.crust, ' '),
    right_sep = create_separator(C.crust, C.crust, ' '),
  })

  table.insert(components_left, {
    provider = 'git_diff_added',
    hl = create_highlight(C.green, C.crust),
    icon = create_icon(C.green, C.crust, assets.git.added .. ' '),
    right_sep = create_separator(C.crust, C.crust, ' '),
  })

  table.insert(components_left, {
    provider = 'git_diff_changed',
    hl = create_highlight(C.yellow, C.crust),
    icon = create_icon(C.yellow, C.crust, assets.git.changed .. ' '),
    right_sep = create_separator(C.crust, C.crust, ' '),
  })

  table.insert(components_left, {
    provider = 'git_diff_removed',
    hl = create_highlight(C.red, C.crust),
    icon = create_icon(C.red, C.crust, assets.git.removed .. ' '),
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
      return lsp.diagnostics_exist(vim.diagnostic.severity.HINT)
    end,
    hl = create_highlight(C.teal, C.crust),
    icon = assets.lsp.hint .. ' ',
    right_sep = create_separator(C.crust, C.crust, ' '),
  })

  table.insert(components_right, {
    provider = 'diagnostic_info',
    enabled = function()
      return lsp.diagnostics_exist(vim.diagnostic.severity.INFO)
    end,
    hl = create_highlight(C.blue, C.crust),
    icon = assets.lsp.info .. ' ',
    right_sep = create_separator(C.crust, C.crust, ' '),
  })

  table.insert(components_right, {
    provider = 'diagnostic_warnings',
    enabled = function()
      return lsp.diagnostics_exist(vim.diagnostic.severity.WARN)
    end,
    hl = create_highlight(C.yellow, C.crust),
    icon = assets.lsp.warning .. ' ',
    right_sep = create_separator(C.crust, C.crust, ' '),
  })

  table.insert(components_right, {
    provider = 'diagnostic_errors',
    enabled = function()
      return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR)
    end,
    hl = create_highlight(C.red, C.crust),
    icon = assets.lsp.error .. ' ',
    right_sep = create_separator(C.crust, C.crust, ' '),
  })

  table.insert(components_right, {
    provider = function()
      local active_clients = vim.lsp.get_active_clients { bufnr = 0 }

      local index = 0
      local lsp_names = ''
      for _, lsp_config in ipairs(active_clients) do
        if 'copilot' == lsp_config.name then
          goto continue
        end

        index = index + 1
        if index == 1 then
          lsp_names = assets.lsp.server .. ' ' .. lsp_config.name
        else
          lsp_names = lsp_names .. '|' .. lsp_config.name
        end

        ::continue::
      end

      return lsp_names
    end,

    hl = create_highlight(C.subtext1, C.crust),
    right_sep = create_separator(C.crust, C.crust, ' '),
  })

  table.insert(components_right, {
    provider = function()
      local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
      return ' ' .. dir_name .. ' '
    end,
    hl = create_highlight(C.text, C.surface0),
    icon = create_icon(C.surface0, C.maroon, assets.dir .. ' '),
    left_sep = create_separator(C.maroon, C.crust, assets.left_separator),
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
    icon = create_icon(C.surface0, C.green, assets.file .. ' '),
    left_sep = create_separator(C.green, C.surface0, assets.left_separator),
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
    require('feline').setup {
      components = get_feline_statusline(),
      force_inactive = force_inactive,
    }
    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = '*',
      callback = function()
        package.loaded['feline'] = nil
        package.loaded['catppuccin.groups.integrations.feline'] = nil

        require('feline').setup {
          components = get_feline_statusline(),
          force_inactive = force_inactive,
        }
      end,
    })
  end,
}
