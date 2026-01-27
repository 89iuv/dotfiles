return {
  "nvim-mini/mini.indentscope",
  enabled = true,
  opts = function(_, opts)
    local mini_indentscope = require("mini.indentscope")

    local excluded_filetype = {
          -- default
          "lspinfo",
          "packer",
          "checkhealth",
          "help",
          "man",
          "gitcommit",
          "TelescopePrompt",
          "TelescopeResults",

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
          "snacks_picker_input",
          "snacks_input",
          "neo-tree-popup",
          "text",
          "noice",
        }

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

    -- disable mini indent scope for filetypes
    vim.api.nvim_create_autocmd("FileType", {
      pattern = excluded_filetype,
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })

    -- disable mini indent scope for buftypes
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        local patterns = excluded_filetype
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
        "http",
        "dockerfile",
      },
      callback = function()
        vim.b.miniindentscope_config = { options = { border = "top" } }
      end,
    })

    local new_opts = {
      draw = {
        delay = 80,
        animation = vim.g.mini_indentscope_animate and mini_indentscope.gen_animation.linear()
          or mini_indentscope.gen_animation.none(),
      },
      options = {
        border = "both",
        try_as_border = true,
      },
      symbol = "│",
    }

    return vim.tbl_deep_extend("force", opts, new_opts)
  end,
}
