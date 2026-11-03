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
      hide_root_node = false,
      popup_border_style = "single",
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
          padding = 2,
          with_expanders = true,
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
          ["?"] = "show_help", -- instead of "o"
          ["h"] = "close_node",
          ["l"] = "open",
          ["<space>"] = "none",
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
          hide_dotfiles = true,
          hide_gitignored = true,
          hide_ignored = true,
          show_hidden_count = false,
        },
        components = {
          indent = function(config, node, state)
            local common = require("neo-tree.sources.common.components")

            if node.level == 0 and config.with_expanders then
              local expander = node:is_expanded() and (config.expander_expanded or "")
                or (config.expander_collapsed or "")
              return {
                text = expander .. " ",
                highlight = config.expander_highlight or config.highlight or "NeoTreeExpander",
              }
            end

            return common.indent(config, node, state)
          end,
          -- indent = function(config, node, state)
          --   local result = require("neo-tree.sources.common.components")
          --     .indent(config, node, state) -- must run for every node
          --   local level = node.level or (node:get_depth() - 1)
          --
          --   if level < 2 then
          --     -- direct children of the root: no indent at all
          --     return { text = "" }
          --   end
          --
          --   -- level >= 2: result is a list of segments, remove the first column
          --   if type(result) == "table" and result[1] ~= nil then
          --     table.remove(result, 1)
          --   end
          --   return result
          -- end,
          -- icon = function(config, node, state)
          --   if node:get_depth() == 1 then
          --     return { text = "" }
          --   end
          --   return require("neo-tree.sources.common.components")
          --     .icon(config, node, state)
          -- end,
          name = function(config, node, state)
            local result = require("neo-tree.sources.filesystem.components").name(config, node, state)
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
      },
    })
  end,
}
