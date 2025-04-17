return {
  "sphamba/smear-cursor.nvim",
  enabled = vim.g.snacks_animate,
  opts = function()
    local abort = false
    vim.api.nvim_create_autocmd({ "TermEnter", "CmdlineEnter" }, {
      callback = function()
        abort = false

        require("smear_cursor").vertical_bar_cursor = true
        vim.defer_fn(function()
          if not abort then
            require("smear_cursor").enabled = false
          end
        end, 500)
      end,
    })

    vim.api.nvim_create_autocmd({ "TermLeave", "CmdlineLeave" }, {
      callback = function()
        abort = true

        require("smear_cursor").vertical_bar_cursor = false
        require("smear_cursor").enabled = true
      end,
    })

    -- Disable relative line number when entering insert mode
    vim.api.nvim_create_autocmd("ModeChanged", {
      pattern = "*:[vV\x16]",
      callback = function()
        if vim.wo.number == true then
          require("smear_cursor").enabled = false
        end
      end,
    })

    -- Enable relative line number when exiting insert mode
    vim.api.nvim_create_autocmd("ModeChanged", {
      pattern = "[vV\x16]:*",
      callback = function()
        if vim.wo.number == true then
          require("smear_cursor").enabled = true
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

      stiffness = 0.8,
      trailing_stiffness = 0.2,
      max_length = 50,

      time_interval = 8, -- milliseconds
    }
  end,
}
