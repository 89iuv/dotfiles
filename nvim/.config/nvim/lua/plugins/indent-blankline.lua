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
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { enabled = false },
    })

    require("ibl").overwrite({
      exclude = {
        filetypes = global.indent_guide.exclude.filetype,
        buftypes = global.indent_guide.exclude.buftype,
      },
    })
  end,
}
