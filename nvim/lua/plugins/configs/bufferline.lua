local global_icons = require("core.ui-globals").icons

local bufferline = require("bufferline")
bufferline.setup({
  -- highlights = require("catppuccin.groups.integrations.bufferline").get(),
  options = {
    close_command = function(bufnum)
      require('bufdelete').bufdelete(bufnum, true)
    end,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        text_align = "left",
        separator = false,
        -- padding = 1
      }
    },
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = true,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local icon = ""
      if level == "error" then icon = global_icons.error.icon end
      if level == "warning" then icon = global_icons.warning.icon end
      if level == "info" then icon = global_icons.info.icon end
      if level == "hint" then icon = global_icons.hint.icon end
      return "" .. icon .. "" -- .. diagnostics_dict[level]
    end,
    show_close_icon = false,
    always_show_bufferline = true,
  }
})

local wk = require("which-key")
wk.register({
  ["<leader>"] = {
    b = {
      name = "Buffer",
      c = { "<cmd>enew<cr>", "Create New Buffer" },
      s = { "<cmd>:w<cr>", "Save" },
      q = { "<cmd>Bdelete<cr>", "Close" },
      n = { "<cmd>BufferLineMoveNext<cr>", "Move Buffer to Next" },
      p = { "<cmd>BufferLineMovePrev<cr>", "Move Buffer to Previous" },
      r = { "<cmd>BufferLineCloseRight<cr>", "Close Buffers to the Right" },
      l = { "<cmd>BufferLineCloseLeft<cr>", "Close Buffers to the Left" },
      o = { "<cmd>exe 'BufferLineCloseLeft' | exe 'BufferLineCloseRight'<cr>", "Close Other Buffers" },
      h = { "<cmd>:vert help bufferline.nvim<cr>", "Open Documentation" },
    },
  }
})

local colors = require("catppuccin.palettes").get_palette()
require("catppuccin.lib.highlighter").syntax({
  BufferLineErrorSelected = { fg = colors.text },
  BufferLineWarningSelected = { fg = colors.text },
  BufferLineInfoSelected = { fg = colors.text },
  BufferLineHintSelected = { fg = colors.text },

  BufferLineIndicatorSelected = { fg = colors.blue }
})
