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
    filesystem = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
      },
    },
  },
}
