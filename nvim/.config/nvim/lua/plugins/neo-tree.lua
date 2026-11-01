return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "echasnovski/mini.icons",
  },
  lazy = false,
  keys = {
    { "<leader>et", "<cmd>Neotree toggle<CR>", desc = "NeoTree Toggle" },
    { "<leader>er", "<cmd>Neotree reveal<CR>", desc = "NeoTree Reveal" },
    { "<leader>ef", "<cmd>Neotree focus<CR>", desc = "NeoTree Focus" },
  },
  config = function()
    local window_width = 40

    local run_in_directory = function(state_tree_node, fzf_picker_function)
      if state_tree_node.type == "directory" then
        fzf_picker_function({
          cwd = state_tree_node:get_id(),
        })
      else
        fzf_picker_function({
          cwd = state_tree_node:get_parent_id(),
        })
      end
    end

    require("neo-tree").setup({
      use_popups_for_input = false,
      close_if_last_window = true,
      enable_git_status = true,
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
          with_expanders = false,
          with_markers = true,
        },
        name = {
          use_git_status_colors = false,
          right_padding = 1,
        },
      },
      window = {
        position = "left",
        auto_expand_width = false,
        mappings = {
          ["h"] = "close_node",
          ["l"] = "open",
          ["<space>"] = "none",
          ["<leader>ff"] = {
            ---@diagnostic disable-next-line: assign-type-mismatch
            function(state)
              run_in_directory(
                state.tree:get_node(),
                Snacks.picker.files
              )
            end,
            desc = "Find Files (Current Node)",
          },
          ["<leader>sg"] = {
            ---@diagnostic disable-next-line: assign-type-mismatch
            function(state)
              run_in_directory(
                state.tree:get_node(),
                Snacks.picker.grep
              )
            end,
            desc = "Live Grep (Current Node)",
          },
        },
      },
      filesystem = {
        use_libuv_file_watcher = true,
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
      event_handlers = {
        -- rember window size
        {
          event = "neo_tree_window_after_open",
          handler = function(args)
            vim.api.nvim_win_set_width(args.winid, window_width)
          end,
        },
        {
          event = "neo_tree_window_before_close",
          handler = function(args)
            window_width = vim.api.nvim_win_get_width(args.winid)
          end,
        },
        -- resize other windows
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
            vim.keymap.set(
              "i",
              "<esc>",
              vim.cmd.stopinsert,
              {
                noremap = true,
                buffer = args.bufnr
              }
            )
          end,
        },
      },
    })
  end,
}
