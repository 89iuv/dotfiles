local M = {
  active_terminal = {
    is_modern = (function()
      local is_modern = false

      local modern_terminals_detection = {
        kitty = vim.fn.getenv("KITTY_PID") ~= vim.NIL and true or false,
      }

      for _, active in pairs(modern_terminals_detection) do
        if active then
          is_modern = true
          break
        end
      end

      return is_modern
    end)(),
  },

  border = "single",

  excluded = {
    filetype = {
      -- default
      "lspinfo",
      "packer",
      "checkhealth",
      "help",
      "man",
      "gitcommit",
      "TelescopePrompt",
      "TelescopeResults",

      -- lazy
      "Trouble",
      "alpha",
      "dashboard",
      "fzf",
      "help",
      "lazy",
      "mason",
      "neo-tree",
      "notify",
      "snacks_dashboard",
      "snacks_notif",
      "snacks_terminal",
      "snacks_win",
      "toggleterm",
      "trouble",

      -- custom
      "markdown",
      "snacks_picker_preview",
      "snacks_picker_list",
      "snacks_picker_input",
      "neo-tree-popup",
      "text",
      "dapui_scopes",
      "dapui_breakpoints",
      "dapui_stacks",
      "dapui_watches",
      "dapui_repl",
      "dapui_console",
      "neotest-summary",
    },

    buftype = {
      -- default
      "nofile",
      "terminal",
      "quickfix",
      "prompt",
    },
  },
}

return M
