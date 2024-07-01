return {
  'luukvbaal/statuscol.nvim',
  branch = '0.10',
  -- enabled = false,
  config = function()
    local builtin = require 'statuscol.builtin'
    require('statuscol').setup {
      -- setopt = true,
      relculright = true,
      clickhandlers = {
        Lnum = builtin.gitsigns_click,
      },
      segments = {
        {
          sign = {
            name = { '.*' },
            namespace = { '.*' },
            -- namespace = { ".*diagnostic.*" },
            -- name = { "todo%-sign.*" }, -- WARN: escape the dash `-`
            maxwidth = 1,
            colwidth = 3,
            auto = false,
            wrap = true,
          },
        },
        {
          text = { builtin.lnumfunc },
          colwidth = 1,
          click = 'v:lua.ScLa',
        },
        {
          sign = {
            name = { 'GitSigns*' },
            namespace = { 'gitsigns' },
            colwidth = 1,
            fillchar = ' ',
            fillcharhl = 'Nrline',
          },
          click = 'v:lua.ScSa',
        },
        {
          text = { ' ' },
          colwidth = 1,
        },
      },
    }
  end,
}
