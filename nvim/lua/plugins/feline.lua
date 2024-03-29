return {
  'freddiehaddad/feline.nvim',
  config = function()
    local get_feline_conf = function()
      local ctp_feline = require 'catppuccin.groups.integrations.feline'

      ctp_feline.setup {
        assets = {
          lsp = {
            server = '󰅡',
            error = '',
            warning = '',
            info = '',
            hint = '',
          },
        },
        view = {
          lsp = {
            progress = false,
            name = true,
            exclude_lsp_names = { 'copilot' },
          },
        },
      }

      return ctp_feline.get()
    end

    local force_inactive = {
      filetypes = {},
      buftypes = {},
      bufnames = {},
    }

    require('feline').setup {
      components = get_feline_conf(),
      force_inactive = force_inactive,
    }

    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = '*',
      callback = function()
        package.loaded['feline'] = nil
        package.loaded['catppuccin.groups.integrations.feline'] = nil

        require('feline').setup {
          components = get_feline_conf(),
          force_inactive = force_inactive,
        }
      end,
    })
  end,
}
