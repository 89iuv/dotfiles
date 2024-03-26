return {
  'stevearc/conform.nvim',
  dependencies = {
    'folke/which-key.nvim',
  },
  config = function()
    require('conform').setup {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },

        sh = { 'shfmt', 'shellcheck' },
      },
    }

    require('which-key').register {
      ['<leader>f'] = { name = '[F]ormat', _ = 'which_key_ignore' },
    }
    vim.keymap.set('n', '<leader>ff', '<ESC><cmd>lua require("conform").format { lsp_fallback = true } <CR>', { desc = '[F]ormat [F]ile' })
    vim.keymap.set('v', '<leader>fr', '<ESC><cmd>lua require("conform").format { lsp_fallback = true } <CR>', { desc = '[F]ormat [R]ange' })
  end,
}
