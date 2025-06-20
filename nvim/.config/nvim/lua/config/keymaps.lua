-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- workaround for <leader>wd not working on fast action
vim.keymap.set("n", "<leader>w", "<nop>", { desc = "Windows", remap = false })

-- move in insert using ctrl+hjkl
vim.keymap.set("i", "<C-h>", "<Left>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-j>", "<Down>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-k>", "<Up>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-l>", "<Right>", { noremap = true, silent = true })

-- -- barbar keymaps
-- -- Move to previous/next
-- vim.keymap.set("n", "<S-h>", "<Cmd>BufferPrevious<CR>", { desc = "Prev Buffer" })
-- vim.keymap.set("n", "<S-l>", "<Cmd>BufferNext<CR>", { desc = "Next Buffer" })
-- vim.keymap.set("n", "[b", "<Cmd>BufferPrevious<CR>", { desc = "Prev Buffer" })
-- vim.keymap.set("n", "]b", "<Cmd>BufferNext<CR>", { desc = "Next Buffer" })
--
-- -- Re-order to previous/next
-- vim.keymap.set("n", "[B", "<Cmd>BufferMovePrevious<CR>", { desc = "Move buffer prev" })
-- vim.keymap.set("n", "]B", "<Cmd>BufferMoveNext<CR>", { desc = "Move buffer next" })
--
-- -- Close buffers
-- vim.keymap.set("n", "<leader>bd", "<Cmd>BufferClose<CR>", { desc = "Delete Buffer" })
-- vim.keymap.set("n", "<leader>bo", "<Cmd>BufferCloseAllButCurrent<CR>", { desc = "Delete Other Buffers" })
-- vim.keymap.set("n", "<leader>bl", "<Cmd>BufferCloseBuffersLeft<CR>", { desc = "Delete Buffers to the Left" })
-- vim.keymap.set("n", "<leader>br", "<Cmd>BufferCloseBuffersRight<CR>", { desc = "Delete Buffers to the Right" })
-- vim.keymap.set("n", "<leader>bP", "<Cmd>BufferCloseAllButPinned<CR>", { desc = "Delete Non-Pinned Buffers" })

-- toggle animations
Snacks.toggle
  .new({
    id = "animate",
    name = "Animations",
    get = function()
      return vim.g.animate_enabled
    end,
    set = function(state)
      -- global
      vim.g.animate_enabled = state

      -- snacks scroll, indent, dim
      vim.g.snacks_animate = state

      -- smear cursor
      vim.g.smear_cursor_animate = state
      require("smear_cursor").enabled = state

      -- mini indent scope
      vim.g.mini_indentscope_animate = state
      local mini_indentscope = require("mini.indentscope")
      if state then
        mini_indentscope.config.draw.animation = mini_indentscope.gen_animation.linear()
      else
        mini_indentscope.config.draw.animation = mini_indentscope.gen_animation.none()
      end
    end,
  })
  :map("<leader>ua")
