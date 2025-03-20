return {
  "akinsho/bufferline.nvim",
  opts = function(_, opts)
    opts.options.always_show_bufferline = true
    opts.options.tab_size = 1
    opts.options.truncate_names = false
    opts.options.offsets = {
      {
        filetype = "neo-tree",
        text = "Project Explorer",
        highlight = "BufferlineProjectExplorer",
        text_align = "left",
        separator = true,
      },
    }
    opts.options.indicator = {
      icon = "▍",
    }
    opts.options.separator_style = { "", "" }
    opts.options.diagnostics_indicator = function(_, _, diag)
      local icons = LazyVim.config.icons.diagnostics
      local ret = (diag.error and icons.Error .. diag.error .. " " or "")
        .. (diag.warning and icons.Warn .. diag.warning or "")
      return vim.trim(ret)
    end
    opts.options.themable = true
  end,
}
