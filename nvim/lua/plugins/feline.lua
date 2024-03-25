return {
  'freddiehaddad/feline.nvim',
  config = function()
    local clrs = require('catppuccin.palettes').get_palette()
    local ctp_feline = require 'catppuccin.groups.integrations.feline'

    ctp_feline.setup {
      assets = {
        right_separator = ' ',
      },
      sett = {
        bkg = clrs.surface0,
      },
    }

    require('feline').setup {
      components = ctp_feline.get(),
      force_inactive = {
        filetypes = {
          '^help$',
        },
        buftypes = {
          '^terminal$',
        },
        bufnames = {},
      },
    }
  end,
}
