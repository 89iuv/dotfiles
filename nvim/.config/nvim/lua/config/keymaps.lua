-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- workaround for <leader>wd not working on fast action
vim.keymap.set("n", "<leader>w", "<nop>", { desc = "Windows", remap = false })

 -- Highlight the word under the coursor
vim.api.nvim_set_keymap('n', '*', '*N', {noremap = true})

-- toggle line column
Snacks.toggle
  .new({
    name = "Line Column",
    get = function()
      ---@diagnostic disable-next-line: undefined-field
      if #vim.opt.colorcolumn:get() ~= 0 then
        return true
      else
        return false
      end
    end,
    set = function(state)
      if state then
        vim.opt.colorcolumn = "119"
      else
        vim.opt.colorcolumn = ""
      end
    end,
  })
  :map("<leader>uu")
