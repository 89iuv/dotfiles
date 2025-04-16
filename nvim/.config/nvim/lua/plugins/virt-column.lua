return {
  "lukas-reineke/virt-column.nvim",
  enabled = true,
  opts = function()
    local enabled = false
    Snacks.toggle
      .new({
        name = "Line Column",
        get = function()
            return enabled
        end,
        set = function(state)
          enabled = state
          require "virt-column".update { enabled = enabled }
        end,
      })
      :map("<leader>uu")

    return {
      enabled = enabled,
      virtcolumn = "119",
      highlight = "VirtColumn"
    }
  end,
}
