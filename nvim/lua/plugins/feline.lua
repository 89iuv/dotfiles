return {
  'freddiehaddad/feline.nvim',
  config = function()
    local overwrite_theme = function()
      local clrs = require('catppuccin.palettes').get_palette()
      local ctp_feline = require 'catppuccin.groups.integrations.feline'
      ctp_feline.setup {
        sett = {
          bkg = clrs.surface0,
        },
      }
      return ctp_feline.get()
    end

    local force_inactive = {
      filetypes = {
        '^help$',
      },
      buftypes = {
        '^terminal$',
      },
      bufnames = {},
    }

    require('feline').setup {
      components = overwrite_theme(),
      force_inactive = force_inactive,
    }

    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = '*',
      callback = function()
        package.loaded['feline'] = nil
        package.loaded['catppuccin.groups.integrations.feline'] = nil

        require('feline').setup {
          components = overwrite_theme(),
          force_inactive = force_inactive,
        }
      end,
    })
  end,
}
