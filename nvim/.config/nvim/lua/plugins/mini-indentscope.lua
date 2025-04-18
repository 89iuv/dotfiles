return {
  "echasnovski/mini.indentscope",
  enabled = true,
  init = function()
    if vim.g.mini_indentscope_animate == nil then
      vim.g.mini_indentscope_animate = vim.g.animate_enabled
    end
  end,
  opts = function(_, opts)
    local mini_indentscope = require("mini.indentscope")
    local global = require("config.global")

    Snacks.toggle
      .new({
        name = "Scope Animation",
        get = function()
          return vim.g.mini_indentscope_animate
        end,
        set = function(state)
          vim.g.mini_indentscope_animate = state
          if state then
            mini_indentscope.config.draw.animation = mini_indentscope.gen_animation.linear()
          else
            mini_indentscope.config.draw.animation = mini_indentscope.gen_animation.none()
          end
        end,
      })
      :map("<leader>uX")

    -- disable mini indentscope for filetypes
    vim.api.nvim_create_autocmd("FileType", {
      pattern = global.indent_guide.exclude.filetype,
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })

    -- disable mini indentscope for buftypes
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        local patterns = global.indent_guide.exclude.buftype
        for _, pattern in ipairs(patterns) do
          if pattern == vim.bo.buftype then
            vim.b.miniindentscope_disable = true
          end
        end
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

    local new_opts = {
      draw = {
        delay = 20,
        animation = vim.g.mini_indentscope_animate
          and mini_indentscope.gen_animation.linear()
          or mini_indentscope.gen_animation.none(),
      },
      options = {
        border = "both",
        try_as_border = true,
      },
    }

    return vim.tbl_deep_extend("force", opts, new_opts)
  end,
}
