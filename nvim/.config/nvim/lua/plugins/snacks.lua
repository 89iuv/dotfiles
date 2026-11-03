return {
  "folke/snacks.nvim",
  dependencies = { "christoomey/vim-tmux-navigator" },
  priority = 1000,
  lazy = false,
  enabled = true,
  -- stylua: ignore
  keys = {
    -- file
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },

    -- grep
    { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
    { "<leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },

    -- search
    { "<leader>sc", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
    { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
    { "<leader>sz", function () Snacks.picker.spelling({layout = {preset = "select"}}) end, desc = "Spelling" },

    -- lsp
    { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
    { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
    { "gi", function() Snacks.picker.lsp_incoming_calls() end, desc = "C[a]lls Incoming" },
    { "go", function() Snacks.picker.lsp_outgoing_calls() end, desc = "C[a]lls Outgoing" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },

    -- diagnostics
    { "<leader>sx", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    { "<leader>sX", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },

    -- git
    { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
    { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
    { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
    { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
    { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },

    -- notifier
    -- { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
    -- { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },

    -- words
    { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
    { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },

    -- terminal
    { "<c-/>", function() Snacks.terminal() end, desc = "Toggle Terminal" },
    { "<c-_>", function() Snacks.terminal() end, desc = "which_key_ignore" },

  },
  config = function()
    require("snacks").setup({
      bigfile = { enabled = true },
      dashboard = {
        enabled = false,
      },
      explorer = { enabled = false },
      indent = { enabled = false },
      input = {
        enabled = true,
        icon = "",
      },
      notifier = {
        enabled = false, -- enabled manually
        timeout = 3500,
        top_down = false,
        sort = { "added" },
        padding = false,
        width = { min = 50, max = 50 },
        height = { min = 1, max = 4 },
        margin = { top = 0, right = 1, bottom = 1 },
      },
      picker = {
        enabled = true,
        ui_select = true,
        sources = {
          files = {
            hidden = true,
          },
          grep = {
            hidden = true,
          },
        },
        formatters = {
          file = {
            filename_first = true,
          },
        },
        previewers = {
          diff = {
            style = "terminal",
            cmd = { "delta", "--file-style=omit" },
          },
        },
      },
      quickfile = { enabled = false },
      scope = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = {
        enabled = false,
        folds = {
          open = false,
        },
      },
      words = {
        enabled = true,
        debounce = 100,
        modes = { "n" },
      },
      terminal = {
        win = {
          height = 0.30,
          wo = {
            winbar = "",
            winhighlight = "Normal:SnacksTerminal,WinBar:SnacksWinBar",
          },
          keys = {
            nav_h = { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Go to Left Window", expr = true, mode = "t" },
            nav_j = { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Go to Lower Window", expr = true, mode = "t" },
            nav_k = { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Go to Upper Window", expr = true, mode = "t" },
            nav_l = { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Go to Right Window", expr = true, mode = "t" },
            term_normal = {
              "<esc><esc>",
              function()
                return "<C-\\><C-n>"
              end,
              mode = "t",
              expr = true,
              desc = "Double escape to normal mode",
            },
          },
        },
      },
      styles = {
        input = {
          relative = "cursor",
          row = -3,
          col = 0,
        },
        notification = {
          wo = {
            wrap = true,
            winblend = 0,
          },
        },
        notification_history = {
          wo = {
            cursorline = true,
          },
        },
      },
    })

    -- ---@diagnostic disable-next-line: duplicate-set-field
    -- vim.notify = function(msg, level, opts)
    --   if opts and opts.title == "Trouble" then
    --     opts.replace = nil
    --   end
    --   return Snacks.notifier.notify(msg, level, opts)
    -- end

    -- vim.api.nvim_create_autocmd("LspProgress", {
    --   ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
    --   callback = function(ev)
    --     local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
    --     vim.notify(vim.lsp.status(), "info", {
    --       id = "lsp_progress",
    --       title = "LSP Progress",
    --       opts = function(notif)
    --         notif.icon = ev.data.params.value.kind == "end" and " "
    --           or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
    --       end,
    --     })
    --   end,
    -- })
  end,
}
