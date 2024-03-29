return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        shade_terminals = false,
        -- start_in_insert = false,
        -- auto_scroll = false,
        open_mapping = [[<c-\>]],
        size = 20,
      }

      function _G.set_terminal_keymaps()
        local opts = { noremap = true }
        vim.api.nvim_buf_set_keymap(0, 't', '<esc><esc>', [[<C-\><C-n>]], opts)
        vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
        vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
        vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
        vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
      end
    end,
  },
}
