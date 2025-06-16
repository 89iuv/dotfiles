return {
  "romgrk/barbar.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
  },
  enabled = true,
  lazy = false,
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = function()
    local lazy_icons = LazyVim.config.icons.diagnostics
    return {
      animation = vim.g.animate_enabled,
      auto_hide = false,
      highlight_inactive_file_icons = true,

      icons = {
        button = "",
        modified = { button = "●" },
        pinned = { button = "󰐃", filename = true },
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = { enabled = true, icon = lazy_icons.Error },
          [vim.diagnostic.severity.WARN] = { enabled = true, icon = lazy_icons.Warn },
          [vim.diagnostic.severity.INFO] = { enabled = true, icon = lazy_icons.Info },
          [vim.diagnostic.severity.HINT] = { enabled = true, icon = lazy_icons.Hint },
        },
        separator_at_end = false,
        separator = { left = "│", right = "" },
        inactive = {
          separator = { left = "│", right = "" },
        },
        scroll = {
          left = "│",
          right = " ",
        },
      },
      sidebar_filetypes = {
        ["neo-tree"] = {
          text = "Project Explorer",
        },
      },

      insert_at_end = true,

      -- tab size
      maximum_padding = 1,
      minimum_padding = 1,
      maximum_length = 30,
      minimum_length = 0,

      no_name_title = "No Name",
    }
  end,
}
