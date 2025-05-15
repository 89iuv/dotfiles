return {
  "romgrk/barbar.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
  },
  enabled = true,
  lazy = true,
  event = "VimEnter",
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = function()
    -- Move to previous/next
    vim.keymap.set("n", "<S-h>", "<Cmd>BufferPrevious<CR>", { desc = "Prev Buffer" })
    vim.keymap.set("n", "<S-l>", "<Cmd>BufferNext<CR>", { desc = "Next Buffer" })
    vim.keymap.set("n", "[b", "<Cmd>BufferPrevious<CR>", { desc = "Prev Buffer" })
    vim.keymap.set("n", "]b", "<Cmd>BufferNext<CR>", { desc = "Next Buffer" })

    -- Re-order to previous/next
    vim.keymap.set("n", "[B", "<Cmd>BufferMovePrevious<CR>", { desc = "Move buffer prev" })
    vim.keymap.set("n", "]B", "<Cmd>BufferMoveNext<CR>", { desc = "Move buffer next" })

    -- Close buffers
    vim.keymap.set("n", "<leader>bd", "<Cmd>BufferClose<CR>", { desc = "Delete Buffer" })
    vim.keymap.set("n", "<leader>bo", "<Cmd>BufferCloseAllButCurrent<CR>", { desc = "Delete Other Buffers" })
    vim.keymap.set("n", "<leader>bl", "<Cmd>BufferCloseBuffersLeft<CR>", { desc = "Delete Buffers to the Left" })
    vim.keymap.set("n", "<leader>br", "<Cmd>BufferCloseBuffersRight<CR>", { desc = "Delete Buffers to the Right" })
    vim.keymap.set("n", "<leader>bP", "<Cmd>BufferCloseAllButPinned<CR>", { desc = "Delete Non-Pinned Buffers" })

    local lazy_icons = LazyVim.config.icons.diagnostics
    return {
      animation = vim.g.animate_enabled,
      auto_hide = false,

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
          left = "",
          right = "",
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
