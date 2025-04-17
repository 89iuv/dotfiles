return {
  "sphamba/smear-cursor.nvim",
  enabled = vim.g.animate_enabled,
  opts = function()
    local smear_cursor = require("smear_cursor")
    local abort = false

    -- Disable when entering terminal or cmdline
    vim.api.nvim_create_autocmd({ "TermEnter", "CmdlineEnter" }, {
      callback = function()
        abort = false

        require("smear_cursor").vertical_bar_cursor = true
        vim.defer_fn(function()
          if not abort then
            smear_cursor.enabled = false
          end
        end, 500)
      end,
    })

    -- Enable when leaving terminal or cmdline
    vim.api.nvim_create_autocmd({ "TermLeave", "CmdlineLeave" }, {
      callback = function()
        abort = true

        smear_cursor.vertical_bar_cursor = false
        smear_cursor.enabled = true
      end,
    })

    -- Disable when entering visual mode
    vim.api.nvim_create_autocmd("ModeChanged", {
      pattern = "*:[vV\x16]",
      callback = function()
        if vim.wo.number == true then
          smear_cursor.enabled = false
        end
      end,
    })

    -- Enable  when leaving visual mode
    vim.api.nvim_create_autocmd("ModeChanged", {
      pattern = "[vV\x16]:*",
      callback = function()
        if vim.wo.number == true then
          smear_cursor.enabled = true
        end
      end,
    })

    return {
      hide_target_hack = false,
      cursor_color = "none",

      never_draw_over_target = true,
      legacy_computing_symbols_support = true,

      smear_terminal_mode = true,
      smear_insert_mode = false,
      smear_to_cmd = true,

      delay_event_to_smear = 10,

      stiffness = 0.7,
      trailing_stiffness = 0.3,
      max_length = 50,

      time_interval = 1000 / vim.g.animate_fps,
    }
  end,
}
