return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim",
  },
  config = function()
    require("lualine").setup({
      options = {
        theme = "catppuccin-nvim",
        component_separators = { left = "│", right = "│" },
        section_separators = { left = "", right = "" },
      },
      extensions = { "neo-tree" },
      sections = {
        lualine_a = {
          { "mode", icon = "" },
        },
        lualine_b = {},
        lualine_c = {
          {
            "branch",
            icon = "󰘬",
            separator = "",
            padding = { left = 1, right = 1 },
          },
          {
            "diagnostics",
            sources = { "nvim_workspace_diagnostic" },
            sections = { 'error', 'warn', 'info', 'hint' },
            colored = false,
            symbols = {
              error = require("config.global").icons.diagnostics_outline.error .. " ",
              warn = require("config.global").icons.diagnostics_outline.warn .. " ",
              info = require("config.global").icons.diagnostics_outline.info .. " ",
              hint = require("config.global").icons.diagnostics_outline.hint .. " ",
            },
            always_visible = true,
            separator = "",
            padding = { left = 1, right = 1 },
          },
        },
        lualine_x = {
          {
            function()
              local line = vim.fn.line(".")
              local lines = vim.api.nvim_buf_line_count(0)

              local col = vim.fn.charcol(".")
              local cols = vim.api.nvim_win_get_width(0)

              return string.format("Ln %0" .. #tostring(lines) .. "d, Col %0" .. #tostring(cols) .. "d", line, col)
            end,
            separator = "",
            padding = { left = 1, right = 1 },
          },
          {
            function()
              return "Spaces:" .. vim.api.nvim_get_option_value("shiftwidth", { buf = 0 })
            end,
            separator = "",
            padding = { left = 1, right = 1 },
          },
          {
            "encoding",
            fmt = string.upper,
            separator = "",
            padding = { left = 1, right = 1 },
          },
          {
            "fileformat",
            fmt = string.upper,
            icons_enabled = true,
            symbols = {
              unix = "lf",
              dos = "crlf",
              mac = "cr",
            },
            separator = "",
            padding = { left = 1, right = 1 },
          },
          {
            function ()
              return vim.bo.filetype
            end,
            icon = "󰅪",
            separator = "",
            padding = { left = 1, right = 1 },
          },
        },
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}
