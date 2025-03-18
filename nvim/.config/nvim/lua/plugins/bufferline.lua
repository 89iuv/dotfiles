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
    opts.options.themable = true
  end,
}
