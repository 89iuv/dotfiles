-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- workaround for <leader>wd not working on fast action
vim.keymap.set("n", "<leader>w", "<nop>", { desc = "Windows", remap = false })

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
