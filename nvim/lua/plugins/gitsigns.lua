return {
  'lewis6991/gitsigns.nvim',
  opts = {
    sign_priority = 1,
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then
          return ']c'
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return '<Ignore>'
      end, { expr = true })

      map('n', '[c', function()
        if vim.wo.diff then
          return '[c'
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return '<Ignore>'
      end, { expr = true })

      -- Actions
      require('which-key').register {
        ['<leader>h'] = { name = '[H]unk', _ = 'which_key_ignore' },
      }

      map('n', '<leader>hr', gs.reset_hunk, { desc = '[H]unk [R]eset' })
      map('v', '<leader>hr', function()
        gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = '[H]unk [R]eset' })
      map('n', '<leader>hR', gs.reset_buffer, { desc = '[H]unk [R]eset buffer' })
      map('n', '<leader>hp', gs.preview_hunk, { desc = '[H]unk [P]review' })
      map('n', '<leader>hb', function()
        gs.blame_line { full = true }
      end, { desc = '[H]unk [B]lame line' })
      map('n', '<leader>hd', gs.diffthis, { desc = '[H]unk [D]iff this' })
    end,
  },
}
