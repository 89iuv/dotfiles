local function button(sc, txt, keybind)
   local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

   local opts = {
      position = "center",
      text = txt,
      shortcut = sc,
      cursor = 5,
      width = 36,
      align_shortcut = "right",
      hl = "AlphaButtons",
   }

   if keybind then
      opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
   end

   return {
      type = "button",
      val = txt,
      on_press = function()
         local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
         vim.api.nvim_feedkeys(key, "normal", false)
      end,
      opts = opts,
   }
end

-- Just an example, supposed to be placed in /lua/custom/
local userPlugins = require "custom.plugins"

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.options = {
   relativenumber = true,
}

M.ui = {
   theme = "catppuccin",
}

M.plugins = {
  status = {
    colorizer = true, 
    alpha = true -- dashboard
  },
  options = {
    statusline = {
      style = "block" -- default, round , slant , block , arrow
    }
  },
  default_plugin_config_replace = {
    nvim_tree = {
      view = {
        hide_root_folder = false,
      },
      git = {
        enable = true
      }
    },
    nvim_treesitter = {
      ensure_installed = {
        "bash",
        "vim",
        "lua",
        "c",
        "cpp",
        "html",
        "css",
        "javascript",
        "java",
        "markdown",
        "yaml"
      }
    },
    telescope = {
      defaults = {
        prompt_prefix = "   "
      }
    },
    alpha = {
      buttons = {
        val = {
          button("SPC f f", "  Find File  ", ":Telescope find_files<CR>"),
          button("SPC f o", "  Recent File  ", ":Telescope oldfiles<CR>"),
          button("SPC f w", "  Find Word  ", ":Telescope live_grep<CR>"),
          button("SPC b m", "  Bookmarks  ", ":Telescope marks<CR>"),
          button("SPC t h", "  Themes  ", ":Telescope themes<CR>"),
          button("SPC e s", "  Settings", ":e $MYVIMRC | :cd %:p:h <CR>")
        }
      }
    },
    gitsigns = {
      signs = {
        delete = { hl = "DiffDelete", text = "-", numhl = "GitSignsDeleteNr" }
      }
    },
    bufferline = {
      options = {
        close_command = function(bufnum)
          require('bufdelete').bufdelete(bufnum, false)
        end 
      }
    }
  },
  install = userPlugins
}

return M
