return {
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  dependencies = { 'echasnovski/mini.icons', version = false },
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup {
      win = { border = 'single', no_overlap = false },
      icons = {
        mappings = false,
      },
    }

    -- TODO: add vim.notify to view the current state
    local toggle = function(option)
      return function()
        ---@diagnostic disable-next-line: assign-type-mismatch
        vim.o[option] = not vim.o[option]
      end
    end

    vim.keymap.set('n', '<leader>tr', toggle 'relativenumber', { desc = '[T]oggle [R]elative Number' })
    vim.keymap.set('n', '<leader>ts', toggle 'spell', { desc = '[T]oggle [S]pell Check' })
  end,
}
