return {
  "romgrk/barbar.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
    "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
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
    { "<leader>bd", "<Cmd>BufferClose<CR>", desc = "Delete Buffer" },
    { "<leader>bo", "<Cmd>BufferCloseAllButCurrent<CR>", desc = "Delete Other Buffers" },
    { "<leader>bl", "<Cmd>BufferCloseBuffersLeft<CR>", desc = "Delete Buffers to the Left" },
    { "<leader>br", "<Cmd>BufferCloseBuffersRight<CR>", desc = "Delete Buffers to the Right" },
    { "<leader>bP", "<Cmd>BufferCloseAllButPinned<CR>", desc = "Delete Non-Pinned Buffers" },
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  lazy = false,
  enabled = true,
  opts = function()
    local lazy_icons = LazyVim.config.icons.diagnostics
    return {
      animation = false,
      auto_hide = false,
      highlight_inactive_file_icons = false,
      highlight_visible = true,
      highlight_alternate = false,

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
          left = "<",
          right = ">",
        },
      },
      sidebar_filetypes = {
        ["neo-tree"] = {
          text = "Project Explorer",
        },
        ["trouble"] = {
          text = "Trouble",
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
