return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
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
    },
    default_component_configs = {
      enable_character_fade = false,
      -- prefere with expanders until set indent level is approved
      -- https://github.com/nvim-neo-tree/neo-tree.nvim/pull/1570
      indent = {
        with_markers = false,
        indent_marker = "│",
        last_indent_marker = "└",
        with_expanders = true,
        expander_collapsed = "",
        expander_expanded = "",
      },
    },
    renderers = {
      -- disable terminal renderer
      -- when selecting a terminal from the buffer list
      -- it will be opened in a new buffer instead of it's buffer
      terminal = {},
    },
    filesystem = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
      filtered_items = {
        visible = true,
        hide_by_name = {
          "__pycache__",
        },
      },
    },
  },
}
