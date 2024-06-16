return {
  'stevearc/conform.nvim',
  dependencies = {
    'folke/which-key.nvim',
  },
  config = function()
    vim.g.disable_autoformat = true

    vim.api.nvim_create_user_command('FormatDisable', function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, {
      desc = 'Disable autoformat-on-save',
      bang = true,
    })

    vim.api.nvim_create_user_command('FormatEnable', function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {
      desc = 'Re-enable autoformat-on-save',
    })

    require('conform').setup {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          ---@diagnostic disable-next-line: missing-return-value
          return
        end
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = require('core.coding').conform.formatters_by_ft,
    }

    require('which-key').register {
      ['<leader>f'] = { name = '[F]ormat', _ = 'which_key_ignore' },
    }
    vim.keymap.set('n', '<leader>ff', '<ESC><cmd>lua require("conform").format { lsp_fallback = true } <CR>', { desc = '[F]ormat [F]ile' })
    vim.keymap.set('v', '<leader>fr', '<ESC><cmd>lua require("conform").format { lsp_fallback = true } <CR>', { desc = '[F]ormat [R]ange' })
  end,
}
