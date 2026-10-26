return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("util.repo_diff").setup()

    require("lualine").setup({
      options = {
        theme = "catppuccin-nvim",
        component_separators = { left = "╱", right = "│" },
        section_separators = { left = "", right = "▐" },
        disabled_filetypes = {
          statusline = { "dashboard" },
        },
      },
      extensions = { "neo-tree", "fzf" },
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
            padding = { left = 1, right = 0 },
          },
          {
            "diff",
            colored = false,
            source = require("util.repo_diff").source,
            symbols = {
              added = require("config.global").icons.git.added,
              modified = require("config.global").icons.git.modified,
              removed = require("config.global").icons.git.removed,
            },
          },
        },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_workspace_diagnostic" },
            colored = false,
            symbols = {
              error = require("config.global").icons.diagnostics_outline.error .. " ",
              warn = require("config.global").icons.diagnostics_outline.warn .. " ",
              info = require("config.global").icons.diagnostics_outline.info .. " ",
              hint = require("config.global").icons.diagnostics_outline.hint .. " ",
            },
            separator = "",
            padding = { left = 0, right = 0 },
          },
          {
            "lsp_status",
            icon = "",
            symbols = {
              done = "󰄬 ",
            },
            padding = { left = 0, right = 1 },
          },
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
        },
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}
