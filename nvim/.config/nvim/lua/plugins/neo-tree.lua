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
  opts = {
    popup_border_style = "single",
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
      container = {
        enable_character_fade = true,
      },
      indent = {
        padding = 1,
        with_markers = true,
        with_expanders = false,
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
      mappings = {
        ["<leader>ff"] = {
          function(state)
            run_in_directory(state.tree:get_node(), Snacks.picker.files)
          end,
        },
        ["<leader>sg"] = {
          function(state)
            run_in_directory(state.tree:get_node(), Snacks.picker.grep)
          end,
        },
      },
    },
    filesystem = {
      group_empty_dirs = true,
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
      filtered_items = {
        visible = true,
        hide_by_name = {
          "__pycache__",
        },
      },
    },
    buffers = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = false,
      },
    },
  },
}
