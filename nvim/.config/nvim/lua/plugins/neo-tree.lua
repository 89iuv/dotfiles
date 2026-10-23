return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "NeoTree toggle" },
  },
  opts = {
    close_if_last_window = true,
    enable_git_status = false,
    sources = { "filesystem" },
    default_component_configs = {
      symlink_target = {
        enabled = true,
      },
      container = {
        enable_character_fade = false,
      },
      indent = {
        padding = 1,
        with_markers = false,
        with_expanders = false,
      },
      name = {
        right_padding = 1,
      },
      file_size = {
        enabled = false,
      },
      type = {
        enabled = false,
      },
      last_modified = {
        enabled = false,
      },
    },
    window = {
      auto_expand_width = false,
    },
    filesystem = {
      group_empty_dirs = false,
      follow_current_file = {
        enabled = false,
        leave_dirs_open = true,
      },
      filtered_items = {
        visible = true,
        show_hidden_count = false,
      },
      components = {
        name = function(config, node, state)
          local fc = require("neo-tree.sources.filesystem.components")
          local result = fc.name(config, node, state)
          if node:get_depth() == 1 and node.type ~= "message" then
            local project_path = "[" .. string.sub(result.text, 1, -2) .. "]"
            local project_name = vim.fn.fnamemodify(node.path, ":t")
            result.text = project_name .. " " .. project_path
            result = {
              {
                text = project_name,
                highlight = "NeoTreeProjectName",
              },
              {
                text = project_path,
                highlight = "NeoTreeProjectPath",
              },
            }
          end
          return result
        end,
      },
    },
  },
}
