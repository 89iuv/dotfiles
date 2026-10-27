return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-mini/mini.icons",
  },
  lazy = false,
  config = function()
    vim.api.nvim_create_autocmd("ModeChanged", {
      pattern = "*:n",
      callback = function(event)
        if vim.bo[event.buf].filetype == "markdown" then
          require("render-markdown").buf_enable()
        end
      end,
    })

    vim.api.nvim_create_autocmd("ModeChanged", {
      pattern = "n:*",
      callback = function(event)
        if vim.bo[event.buf].filetype == "markdown" then
          require("render-markdown").buf_disable()
        end
      end,
    })

    require("render-markdown").setup({
      completions = {
        lsp = {
          enabled = true,
        },
      },
      anti_conceal = {
        enabled = true,
        ignore = {
          code_background = false,
        },
      },
      latex = {
        enabled = false,
      },
      link = {
        enabled = true,
      },
      checkbox = {
        enabled = true,
      },
      code = {
        sign = false,
        language_icon = true,
        width = "full",
        border = "thin",
        disable_background = {},
      },
      heading = {
        sign = false,
        icons = {
          "█ ",
          "██ ",
          "███ ",
          "████ ",
          "█████ ",
          "██████ ",
        },
      },
      pipe_table = {
        style = "normal",
        border = { " ", " ", " ", "─", "─", "─", " ", " ", " ", " ", "─" },
      },
      html = {
        comment = {
          -- Turn on / off HTML comment concealing
          conceal = false,
        },
      },
      win_options = {
        conceallevel = {
          default = 0,
          rendered = 2,
        },
      },
    })
  end,
}
