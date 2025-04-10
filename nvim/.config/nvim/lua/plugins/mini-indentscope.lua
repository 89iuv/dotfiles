return {
  "echasnovski/mini.indentscope",
  enabled = true,
  opts = function(_, opts)
    -- disable mini indentscope for filetypes
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "checkhealth",
        "markdown",
        "grug-far-help",
        "snacks_picker_preview",
        "noice",
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })

    -- set custom border for filetype
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "python",
        "gitconfig",
        "yaml",
        "sh",
      },
      callback = function()
        vim.b.miniindentscope_config = { options = { border = "top" } }
      end,
    })

    opts.draw = {
      delay = 0,
      animation = require("mini.indentscope").gen_animation.none(),
    }

    opts.options = {
      border = "both",
      try_as_border = true,
    }
  end,
}
