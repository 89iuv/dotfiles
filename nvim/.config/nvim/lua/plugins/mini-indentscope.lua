return {
  "echasnovski/mini.indentscope",
  enabled = true,
  opts = function(_, opts)
    local global = require("config.global")

    -- disable mini indentscope for filetypes
    vim.api.nvim_create_autocmd("FileType", {
      pattern = global.indent_guide.exclude.filetypes,
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })

    -- disable mini indentscope for buftypes
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function ()
        local patterns = global.indent_guide.exclude.buftype
        for _, pattern in ipairs(patterns) do
          if pattern == vim.bo.buftype then
            vim.b.miniindentscope_disable = true
          end
        end
      end
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

    local new_opts = {
      draw = {
        delay = 0,
        animation = require("mini.indentscope").gen_animation.none(),
      },
      options = {
        border = "both",
        try_as_border = true,
      },
    }

    return vim.tbl_deep_extend("force", opts, new_opts)
  end,
}
