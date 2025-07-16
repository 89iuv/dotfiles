return {
  "okuuva/auto-save.nvim",
  -- version = "^1.0.0",
  cmd = "ASToggle",
  event = {  "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
  opts = function (_, opts)
    opts.enabled = true
    opts.debounce_delay = 80

    Snacks.toggle({
      name = "Autosave",
      get = function()
        return opts.enabled
      end,
      set = function(_)
        opts.enabled = not opts.enabled
        require("auto-save").toggle()
      end,
    }):map("<leader>uW")
  end
}
