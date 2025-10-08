local run_in_directory = function(state_tree_node, snacks_picker_function)
  if state_tree_node.type == "directory" then
    snacks_picker_function({
      cwd = state_tree_node:get_id(),
    })
  else
    snacks_picker_function({
      cwd = state_tree_node:get_parent_id(),
    })
  end
end

return {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = false, -- netrw jacking does not work if plugin is lazy loaded
  keys = {
    {
      "<leader>fl",
      function()
        require("neo-tree.command").execute({ reveal = true, dir = LazyVim.root() })
      end,
      desc = "Explorer Reveal File (Root Dir)",
    },
    {
      "<leader>fL",
      function()
        require("neo-tree.command").execute({ reveal = true, dir = vim.uv.cwd() })
      end,
      desc = "Explorer Reveal File (cwd)",
    },
  },
  init = function()
    -- refresh buffer when a terminal is closed
    vim.api.nvim_create_autocmd("TermClose", {
      callback = function()
        require("neo-tree.sources.buffers.commands").refresh()
      end,
    })
  end,
  opts = {
    popup_border_style = require("config.global").border,
    close_if_last_window = true,
    event_handlers = {
      {
        event = "neo_tree_window_after_open",
        handler = function(args)
          if args.position == "left" or args.position == "right" then
            vim.cmd("wincmd =")
          end
        end,
      },
      {
        event = "neo_tree_window_after_close",
        handler = function(args)
          if args.position == "left" or args.position == "right" then
            vim.cmd("wincmd =")
          end
        end,
      },
      {
        event = "neo_tree_popup_input_ready",
        handler = function(args)
          -- map <esc> to enter normal mode (by default closes prompt)
          vim.keymap.set("i", "<esc>", vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })
        end,
      },
    },
    default_component_configs = {
      git_status = {
        symbols = {
          modified = "",
        },
      },
      symlink_target = {
        enabled = true,
      },
      container = {
        enable_character_fade = false,
      },
      indent = {
        padding = 1,
        with_markers = true,
        with_expanders = false,
      },
      name = {
        use_git_status_colors = false,
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
      width = 40, -- Applies to left and right positions
      auto_expand_width = false,
      mappings = {
        ["<S-l>"] = "refresh", -- disable keymap as it conflicts with barbar
        ["<leader>ff"] = {
          function(state)
            run_in_directory(state.tree:get_node(), Snacks.picker.files)
          end,
          desc = "Find Files (Current Node)",
        },
        ["<leader>sg"] = {
          function(state)
            run_in_directory(state.tree:get_node(), Snacks.picker.grep)
          end,
          desc = "Grep (Current Node)",
        },
      },
    },
    filesystem = {
      group_empty_dirs = false,
      follow_current_file = {
        enabled = false,
        leave_dirs_open = true,
      },
      filtered_items = {
        visible = true,
        hide_gitignored = false,
        hide_by_name = {
          "__pycache__",
        },
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
    buffers = {
      follow_current_file = {
        enabled = false,
        leave_dirs_open = true,
      },
    },
  },
}
