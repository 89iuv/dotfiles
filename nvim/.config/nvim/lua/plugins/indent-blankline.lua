return {
  "lukas-reineke/indent-blankline.nvim",
  enabled = true,
  config = function()
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
        filetypes = {
          -- default
          "lspinfo",
          "packer",
          "checkhealth",
          "help",
          "man",
          "gitcommit",
          "TelescopePrompt",
          "TelescopeResults",
          "",

          -- lazy
          "Trouble",
          "alpha",
          "dashboard",
          "fzf",
          "help",
          "lazy",
          "mason",
          "neo-tree",
          "notify",
          "snacks_dashboard",
          "snacks_notif",
          "snacks_terminal",
          "snacks_win",
          "toggleterm",
          "trouble",

          -- custom
          "markdown",
          "snacks_picker_preview",
          "snacks_picker_list",
        },
        buftypes = {
          "terminal",
          "quickfix",
          "prompt",
        },
      },
    })
  end,
}
