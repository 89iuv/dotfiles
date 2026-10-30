return {
  "89iuv/barbar.nvim",
  -- use fork until PR: https://github.com/romgrk/barbar.nvim/pull/671 is merged
  -- "romgrk/barbar.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim",
    "echasnovski/mini.icons"
  },
  keys = {
    -- Move to previous/next
    { "<S-h>", "<Cmd>BufferPrevious<CR>", desc = "Prev Buffer" },
    { "<S-l>", "<Cmd>BufferNext<CR>", desc = "Next Buffer" },
    { "<M-[>", "<Cmd>BufferPrevious<CR>", desc = "Prev Buffer" },
    { "<M-]>", "<Cmd>BufferNext<CR>", desc = "Next Buffer" },

    -- Re-order to previous/next
    { "<M-{>", "<Cmd>BufferMovePrevious<CR>", desc = "Move buffer prev" },
    { "<M-}>", "<Cmd>BufferMoveNext<CR>", desc = "Move buffer next" },

    -- Close buffers
    { "<leader>bq", "<Cmd>BufferClose<CR>", desc = "Close Buffer" },
    { "<leader>bo", "<Cmd>BufferCloseAllButCurrent<CR>", desc = "Close Other Buffers" },
    { "<leader>bl", "<Cmd>BufferCloseBuffersLeft<CR>", desc = "Close Buffers to the Left" },
    { "<leader>br", "<Cmd>BufferCloseBuffersRight<CR>", desc = "Close Buffers to the Right" },
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  lazy = false,
  enabled = true,
  opts = function()
    local icons = require("config.global").icons

    return {
      animation = false,
      auto_hide = false,
      highlight_inactive_file_icons = false,
      highlight_visible = true,
      highlight_alternate = false,

      icons = {
        button = "󰖭 ",
        modified = { button = "󰐕 " },
        pinned = { button = "󰐃", filename = true },
        gitsigns = {
          added = { enabled = true, icon = icons.git.added },
          changed = { enabled = true, icon =icons.git.modified },
          deleted = { enabled = true, icon = icons.git.removed },
        },
        diagnostics = {
          [vim.diagnostic.severity.HINT] = { enabled = true, icon = icons.diagnostics.hint .. " " },
          [vim.diagnostic.severity.INFO] = { enabled = true, icon = icons.diagnostics.info .. " "  },
          [vim.diagnostic.severity.WARN] = { enabled = true, icon = icons.diagnostics.warn .. " " },
          [vim.diagnostic.severity.ERROR] = { enabled = true, icon = icons.diagnostics.error .. " " },
        },
        separator_at_end = false,
        separator = { left = "", right = " " },
        inactive = {
          separator = { left = "", right = " " },
        },
        scroll = {
          left = "<",
          right = ">",
        },
      },
      sidebar_filetypes = {
        ["neo-tree"] = {
          text = "Project Explorer",
          separator = "│",
          align = "left"
        },
        ["trouble"] = {
          text = "Trouble",
          separator = "│",
          align = "left"
        },
      },

      insert_at_end = true,

      -- tab size
      maximum_padding = 1,
      minimum_padding = 1,
      maximum_length = 30,
      minimum_length = 0,

      no_name_title = "[No Name]",
    }
  end,
}
