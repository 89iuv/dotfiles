return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    { "catppuccin/nvim" },
  },
  opts = function(_, opts)
    local catppuccin_palettes = require("catppuccin.palettes").get_palette("mocha")
    local lualine_catppuccin = require("catppuccin.utils.lualine")()

    lualine_catppuccin.normal.c.bg = catppuccin_palettes.crust
    lualine_catppuccin.inactive.c.bg = catppuccin_palettes.crust

    opts.options.theme = lualine_catppuccin
    opts.options.component_separators = { left = "", right = "│" }
    opts.options.section_separators = { left = "", right = "" }
    opts.options.disabled_filetypes = {}

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
      LazyVim.lualine.root_dir({ icon = "󱉭" }),
      {
        "diagnostics",
        symbols = {
          error = icons.diagnostics.Error,
          warn = icons.diagnostics.Warn,
          info = icons.diagnostics.Info,
          hint = icons.diagnostics.Hint,
        },
      },
      { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
      { LazyVim.lualine.pretty_path(), padding = { left = 0, right = 1 } },
    }
    opts.sections.lualine_y = {
      { "progress", separator = " ", padding = { left = 1, right = 0 } },
      { "location", padding = { left = 0, right = 1 } },
    }
    opts.sections.lualine_z = {
      { "fileformat", separator = "" },
      { "encoding", separator = "", padding = { left = 0, right = 1 } },
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
