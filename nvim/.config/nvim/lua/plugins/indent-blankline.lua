return {
  "lukas-reineke/indent-blankline.nvim",
  enabled = true,
  config = function()
    local global = require("config.global")

    Snacks.toggle({
      name = "Indention Guides",
      get = function()
        return require("ibl.config").get_config(0).enabled
      end,
      set = function(state)
        require("ibl").setup_buffer(0, { enabled = state })
      end,
    }):map("<leader>ug")

    require("ibl").setup({
      debounce = 160,
      indent = {
        char = "│",
      },
      scope = {
        enabled = false,
      },
    })

    require("ibl").overwrite({
      exclude = {
        filetypes = global.special_files.excluded.filetype,
        buftypes = global.special_files.excluded.buftype,
      },
    })
  end,
}
