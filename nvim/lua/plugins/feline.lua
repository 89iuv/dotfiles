return {
  'freddiehaddad/feline.nvim',
  config = function()
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
      components = require('catppuccin.groups.integrations.feline').get(),
      force_inactive = force_inactive,
    }

    vim.api.nvim_create_autocmd('ColorScheme', {
      pattern = '*',
      callback = function()
        package.loaded['feline'] = nil
        package.loaded['catppuccin.groups.integrations.feline'] = nil

        require('feline').setup {
          components = require('catppuccin.groups.integrations.feline').get(),
          force_inactive = force_inactive,
        }
      end,
    })
  end,
}
