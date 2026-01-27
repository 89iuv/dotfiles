return {
  "MagicDuck/grug-far.nvim",
  opts = function(_, opts)
    -- Move window to the right and set size
    vim.api.nvim_create_autocmd("Filetype", {
      pattern = { "help", "grug-far" },
      callback = function()
        vim.cmd("wincmd L")
        vim.api.nvim_win_set_width(0, 82)
        vim.opt_local.statuscolumn = ""
        vim.wo.winhighlight = "Normal:NormalFloat"
      end,
    })

    return opts
  end,
}
