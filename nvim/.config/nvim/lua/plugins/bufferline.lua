return {
  "akinsho/bufferline.nvim",
  opts = function(_, opts)
    local new_opts = {
      options = {
        always_show_bufferline = true,
        tab_size = 1,
        truncate_names = false,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Project Explorer",
            highlight = "BufferlineProjectExplorer",
            text_align = "left",
            separator = true,
          },
        },
        indicator = {
          icon = "▎",
        },
        left_trunc_marker = "󰁍 ",
        right_trunc_marker = "󰁔 ",
        buffer_close_icon = "",
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
