return {
  'stevearc/conform.nvim',
  dependencies = {
    'folke/which-key.nvim',
    'neovim/nvim-lspconfig',
  },
  event = 'BufRead',
  config = function()
    vim.g.disable_autoformat = false

    vim.api.nvim_create_user_command('FormatDisable', function()
      vim.g.disable_autoformat = true
      vim.notify('AutoFormat: ' .. (vim.g.disable_autoformat and 'Disabled' or 'Enabled'))
    end, {
      desc = 'Disable AutoFormat',
    })

    vim.api.nvim_create_user_command('FormatEnable', function()
      vim.g.disable_autoformat = false
      vim.notify('AutoFormat: ' .. (vim.g.disable_autoformat and 'Disabled' or 'Enabled'))
    end, {
      desc = 'Enable AutoFormat',
    })

    vim.api.nvim_create_user_command('FormatToggle', function()
      vim.g.disable_autoformat = not vim.g.disable_autoformat
      vim.notify('AutoFormat: ' .. (vim.g.disable_autoformat and 'Disabled' or 'Enabled'))
    end, { desc = 'Toggle AutoFormat' })

    local load_global_formaters = function()
      local global_formatters = require('global.languages').conform

      local available_formatters = {}
      for filetype, formatters in pairs(global_formatters.formatters_by_ft) do
        available_formatters[filetype] = {}
        for _, formatter in ipairs(formatters) do
          local out = vim.fn.system('which' .. ' ' .. formatter)
          if not string.find(out, 'not found') then
            table.insert(available_formatters[filetype], formatter)
          end
        end
      end

      return available_formatters
    end

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
      formatters_by_ft = load_global_formaters(),
    }

    require('which-key').register {
      ['<leader>f'] = { name = '[F]ormat', _ = 'which_key_ignore' },
    }
    vim.keymap.set('n', '<leader>tf', '<ESC><cmd>FormatToggle<CR>', { desc = '[T]oggle Auto [F]format on Save' })
    vim.keymap.set('n', '<leader>ff', '<ESC><cmd>lua require("conform").format { lsp_fallback = true } <CR>', { desc = '[F]ormat [F]ile' })
    vim.keymap.set('v', '<leader>fr', '<ESC><cmd>lua require("conform").format { lsp_fallback = true } <CR>', { desc = '[F]ormat [R]ange' })
  end,
}
