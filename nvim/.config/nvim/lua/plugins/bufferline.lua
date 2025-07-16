return {
  "akinsho/bufferline.nvim",
  event = "BufEnter",
  enabled = true,
  keys = {
    { "<M-[>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
    { "<M-]>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
    { "<M-{>", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
    { "<M-}>", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
  },
  opts = function(_, opts)
    local project_exporer_filetypes = {
      "neo-tree",
    }
    local side_bar_filetypes = {
      "help",
      "trouble",
      "grug-far",
      "neotest-summary",
      "json.kulala_ui",
      "text.kulala_ui",
      "copilot-chat",
    }

    local offsets = {}
    for _, project_exporer_filetype in ipairs(project_exporer_filetypes) do
      local offset = {
        filetype = project_exporer_filetype,
        text = "Project Explorer",
        highlight = "BufferlineProjectExplorer",
        text_align = "left",
        separator = true,
      }
      table.insert(offsets, offset)
    end

    for _, side_bar_filetype in ipairs(side_bar_filetypes) do
      local offset = {
        filetype = side_bar_filetype,
        text = "Side Bar",
        highlight = "BufferlineSideBar",
        text_align = "left",
        separator = true,
      }
      table.insert(offsets, offset)
    end

    local new_opts = {
      options = {
        always_show_bufferline = true,
        tab_size = 1,
        truncate_names = false,
        offsets = offsets,
        indicator = {
          icon = "▎",
        },
        left_trunc_marker = "󰁍",
        right_trunc_marker = "󰁔",
        separator_style = { " ", " " },
        diagnostics_indicator = function(_, _, diag)
          local icons = LazyVim.config.icons.diagnostics
          local ret = ""
          if diag.error then
            ret = icons.Error
          elseif diag.warning then
            ret = icons.Warn
          elseif diag.info then
            ret = icons.Info
          elseif diag.hint then
            ret = icons.Hint
          end
          return vim.trim(ret)
        end,
        themable = true,
      },
    }

    return vim.tbl_deep_extend("force", opts, new_opts)
  end,
}
