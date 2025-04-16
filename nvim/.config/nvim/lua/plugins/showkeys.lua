return {
  "nvzone/showkeys",
  opts = function()
    Snacks.toggle
      .new({
        name = "Show Keys",
        get = function()
          return require("showkeys.state").visible
        end,
        set = function(state)
          if state then
            require("showkeys").open()
          else
            require("showkeys").close()
          end
        end,
      })
      :map("<leader>uk")

    return {
      timeout = 3,
      maxkeys = 8,
      show_count = true,
      position = "bottom-center",
    }
  end,
}
