return {
  "nvim-mini/mini.indentscope",
  enabled = true,
  opts = function(_, opts)
    local mini_indentscope = require("mini.indentscope")

    local excluded_filetype = vim.g.special_filetypes
    local excluded_buftype = vim.g.special_buftypes

    Snacks.toggle
      .new({
        name = "Indentation Scope",
        get = function()
          return vim.b.miniindentscope_disable
        end,
        set = function(state)
          vim.b.miniindentscope_disable = state
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
        local patterns = excluded_buftype
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
        "markdown",
      },
      callback = function()
        vim.b.miniindentscope_config = { options = { border = "top" } }
      end,
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(event)
        if vim.bo[event.buf].filetype == "markdown" then
            vim.b.miniindentscope_disable = true
        end
      end,
    })

    vim.api.nvim_create_autocmd("ModeChanged", {
      pattern = "*:n",
      callback = function(event)
        if vim.bo[event.buf].filetype == "markdown" then
            vim.b.miniindentscope_disable = true
        end
      end,
    })

    vim.api.nvim_create_autocmd("ModeChanged", {
      pattern = "n:*",
      callback = function(event)
        if vim.bo[event.buf].filetype == "markdown" then
            vim.b.miniindentscope_disable = false
        end
      end,
    })

    local new_opts = {
      draw = {
        delay = 160,
        animation = mini_indentscope.gen_animation.none(),
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
