return {
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup {
      window = { border = 'single' },
    }

    -- TODO: move this to the plugin itself
    -- Document existing key chains
    require('which-key').register {
      ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
      ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
      ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
      ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
    }

    require('which-key').register {
      ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
    }

    -- TODO: add vim.notify to view the current state
    local toggle = function(option)
      return function()
        vim.o[option] = not vim.o[option]
      end
    end

    vim.keymap.set('n', '<leader>tr', toggle 'relativenumber', { desc = '[T]oggle [R]elative Number' })
    vim.keymap.set('n', '<leader>ts', toggle 'spell', { desc = '[T]oggle [S]pell Check' })
  end,
}
