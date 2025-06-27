return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    { "catppuccin/nvim" },
  },
  opts = function(_, opts)
    local lualine_catppuccin = require("catppuccin.utils.lualine")()
    local colors = require("catppuccin.palettes").get_palette("mocha")
    local colors_utils = require("catppuccin.utils.colors")

    lualine_catppuccin.normal.c.bg = colors_utils.blend(colors.mantle, colors.crust, 0.5)
    lualine_catppuccin.inactive.c.bg = colors_utils.blend(colors.mantle, colors.crust, 0.5)

    opts.options.theme = lualine_catppuccin
    opts.options.component_separators = { left = "", right = "│" }
    opts.options.section_separators = { left = "", right = "▐" }
    -- opts.options.disabled_filetypes = {} -- enable for bufferline, disable for barbar

    local icons = LazyVim.config.icons
    opts.sections.lualine_a = {
      { "mode", icon = "" },
    }
    opts.sections.lualine_b = {
      {
        "branch",
        fmt = function(str)
          local branch = str
          if string.len(str) > 32 then
            branch = string.sub(str, 1, 17) .. "…" .. string.sub(str, -13)
          end

          return branch
        end,
        icon = "",
      },
    }
    opts.sections.lualine_c = {
      {
        "diff",
        symbols = {
          added = icons.git.added,
          modified = icons.git.modified,
          removed = icons.git.removed,
        },
        source = function()
          local gitsigns = vim.b.gitsigns_status_dict
          if gitsigns then
            return {
              added = gitsigns.added,
              modified = gitsigns.changed,
              removed = gitsigns.removed,
            }
          end
        end,
      },
      LazyVim.lualine.root_dir({ icon = "󱉭" }),
      { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
      { LazyVim.lualine.pretty_path(), padding = { left = 0, right = 1 } },
    }
    opts.sections.lualine_x = {
      Snacks.profiler.status(),
      {
        function()
          ---@diagnostic disable-next-line: undefined-field
          return require("noice").api.status.command.get()
        end,
        cond = function()
          ---@diagnostic disable-next-line: undefined-field
          return package.loaded["noice"] and require("noice").api.status.command.has()
        end,
        color = function()
          return { fg = Snacks.util.color("Statement") }
        end,
      },
      {
        function()
          ---@diagnostic disable-next-line: undefined-field
          return require("noice").api.status.mode.get()
        end,
        cond = function()
          ---@diagnostic disable-next-line: undefined-field
          return package.loaded["noice"] and require("noice").api.status.mode.has()
        end,
        color = function()
          return { fg = Snacks.util.color("Constant") }
        end,
      },
      {
        function()
          return "  " .. require("dap").status()
        end,
        cond = function()
          return package.loaded["dap"] and require("dap").status() ~= ""
        end,
        color = function()
          return { fg = Snacks.util.color("Debug") }
        end,
      },
    }
    opts.sections.lualine_y = {
      {
        function()
          local cur = vim.fn.line(".")
          local total = vim.fn.line("$")
          return string.format("%03d%%%%", math.floor(cur / total * 100))
        end,
        icon = "󰦪",
        separator = "",
        padding = { left = 1, right = 1 },
      },
      {
        function()
          local line = vim.fn.line(".")
          local lines = vim.api.nvim_buf_line_count(0)

          local col = vim.fn.charcol(".")
          local cols = vim.api.nvim_win_get_width(0)

          return string.format("%0" .. #tostring(lines) .. "d:%0" .. #tostring(cols) .. "d", line, col)
        end,
        icon = "󰆾",
        padding = { left = 0, right = 1 },
      },
    }
    opts.sections.lualine_z = {
      {
        function()
          return vim.api.nvim_get_option_value("shiftwidth", { buf = 0 })
        end,
        icon = "󰌒",
        separator = "",
        padding = { left = 1, right = 1 },
      },
      {
        "encoding",
        fmt = string.upper,
        icon = "󰦩",
        separator = "",
        padding = { left = 0, right = 1 },
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
        icon = "󰌑",
        separator = "",
        padding = { left = 0, right = 1 },
      },
    }

    -- do not add trouble symbols if aerial is enabled
    -- And allow it to be overriden for some buffer types (see autocmds)
    if vim.g.trouble_lualine and LazyVim.has("trouble.nvim") then
      local trouble = require("trouble")
      local symbols = trouble.statusline({
        mode = "symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon}{symbol.name:Normal}",
        hl_group = "lualine_c_normal",
      })
      table.insert(opts.sections.lualine_c, {
        symbols and symbols.get,
        cond = function()
          return vim.b.trouble_lualine ~= false and symbols.has()
        end,
      })
    end
  end,
}
