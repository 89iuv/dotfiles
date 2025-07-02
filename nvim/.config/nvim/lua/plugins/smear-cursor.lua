return {
  "sphamba/smear-cursor.nvim",
  init = function ()
    if vim.g.smear_cursor_animate == nil then
      vim.g.smear_cursor_animate = vim.g.animate_enabled
    end
  end,
  opts = function()
    local global = require("config.global")
    local smear_cursor = require("smear_cursor")
    local abort = false

    Snacks.toggle
      .new({
        name = "Cursor Smear",
        get = function()
          return vim.g.smear_cursor_animate
        end,
        set = function(state)
          vim.g.smear_cursor_animate = state
          smear_cursor.enabled = state
        end,
      })
      :map("<leader>uU")

    -- Disable when entering terminal or cmdline
    vim.api.nvim_create_autocmd({ "TermEnter", "CmdlineEnter" }, {
      callback = function()
        if not vim.g.smear_cursor_animate then
          return
        end

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
        if not vim.g.smear_cursor_animate then
          return
        end

        abort = true
        smear_cursor.vertical_bar_cursor = false
        smear_cursor.enabled = true
      end,
    })

    -- Disable when entering visual mode
    vim.api.nvim_create_autocmd("ModeChanged", {
      pattern = "*:[vV\x16]",
      callback = function()
        if not vim.g.smear_cursor_animate then
          return
        end

        if vim.wo.number == true then
          smear_cursor.enabled = false
        end
      end,
    })

    -- Enable  when leaving visual mode
    vim.api.nvim_create_autocmd("ModeChanged", {
      pattern = "[vV\x16]:*",
      callback = function()
        if not vim.g.smear_cursor_animate then
          return
        end

        if vim.wo.number == true then
          smear_cursor.enabled = true
        end
      end,
    })

    return {
      enabled = vim.g.smear_cursor_animate,

      hide_target_hack = false,
      cursor_color = "none",

      never_draw_over_target = false,
      legacy_computing_symbols_support = global.active_terminal.is_modern,

      smear_insert_mode = false,
      smear_terminal_mode = true,
      smear_to_cmd = true,

      delay_event_to_smear = (1000 / vim.g.animate_fps) / 4,
      time_interval = 1000 / vim.g.animate_fps,

      stiffness = 0.6,
      trailing_stiffness = 0.4,
      anticipation = 0.2,
      damping = 0.8,

      max_length = 25,
    }
  end,
}
