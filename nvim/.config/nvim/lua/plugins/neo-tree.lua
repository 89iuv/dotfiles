return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "echasnovski/mini.icons",
  },
  lazy = false, -- neo-tree will lazily load itself
  keys = {
    { "<leader>et", "<cmd>Neotree toggle<CR>", desc = "NeoTree Toggle" },
    { "<leader>er", "<cmd>Neotree reveal<CR>", desc = "NeoTree Reveal" },
    { "<leader>ef", "<cmd>Neotree focus<CR>", desc = "NeoTree Focus" },
  },
  config = function()
    local border = require("config.global").border

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
      hide_root_node = false,
      popup_border_style = border,
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
          indent_size = 2,
          padding = 1,
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          with_expanders = true,
          expander_collapsed = "",
          expander_expanded = "",
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
          ["<space>"] = "none",
          ["h"] = "close_node",
          ["l"] = "open",
          ["<leader>ff"] = {
            ---@diagnostic disable-next-line: assign-type-mismatch
            function(state)
              run_in_directory(state.tree:get_node(), Snacks.picker.files)
            end,
            desc = "Find Files (Current Node)",
          },
          ["<leader>sg"] = {
            ---@diagnostic disable-next-line: assign-type-mismatch
            function(state)
              run_in_directory(state.tree:get_node(), Snacks.picker.grep)
            end,
            desc = "Live Grep (Current Node)",
          },
          ["y"] = "none",
          ["yy"] = "copy_to_clipboard",
          ["yf"] = function(state)
            ---@diagnostic disable-next-line: undefined-field
            local node = state.tree:get_node()
            local filename = node.name
            vim.fn.setreg("+", filename)
            vim.notify("Copied file name: " .. filename)
          end,
          ["ya"] = function(state)
            ---@diagnostic disable-next-line: undefined-field
            local node = state.tree:get_node()
            local absolute_path = node:get_id()
            vim.fn.setreg("+", absolute_path)
            vim.notify("Copied absolute path: " .. absolute_path)
          end,
          ["yr"] = function(state)
            ---@diagnostic disable-next-line: undefined-field
            local node = state.tree:get_node()
            local absolute_path = node:get_id()
            local relative_path = vim.fn.fnamemodify(absolute_path, ":.")
            vim.fn.setreg("+", relative_path)
            vim.notify("Copied relative path: " .. relative_path)
          end,
        },
      },
      filesystem = {
        use_libuv_file_watcher = true,
        -- NOTE: this does not work: https://github.com/nvim-neo-tree/neo-tree.nvim/issues/2099
        group_empty_dirs = false,
        follow_current_file = {
          enabled = false,
          leave_dirs_open = true,
        },
        filtered_items = {
          visible = true,
          hide_dotfiles = true,
          hide_gitignored = true,
          hide_ignored = true,
          show_hidden_count = false,
        },
        components = {
          name = function(config, node, state)
            local result = require("neo-tree.sources.filesystem.components").name(config, node, state)
            if node:get_depth() == 1 then
              local project_path = "[" .. string.sub(result.text, 1, -2) .. "]"
              local project_name = vim.fn.fnamemodify(node.path, ":t")
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
        -- {
        --   event = "neo_tree_window_after_open",
        --   handler = function(args)
        --     if args.position == "left" or args.position == "right" then
        --       vim.cmd("wincmd =")
        --     end
        --   end,
        -- },
        -- {
        --   event = "neo_tree_window_after_close",
        --   handler = function(args)
        --     if args.position == "left" or args.position == "right" then
        --       vim.cmd("wincmd =")
        --     end
        --   end,
        -- },
        -- close dashboard
        {
          event = "neo_tree_window_before_open",
          handler = function()
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
              if vim.bo[buf].filetype == "snacks_dashboard" then
                vim.api.nvim_buf_delete(buf, { force = true })
              end
            end
          end,
        },
      },
    })
  end,
}
