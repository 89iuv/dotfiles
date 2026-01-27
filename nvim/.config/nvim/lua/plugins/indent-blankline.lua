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

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(event)
        if vim.bo[event.buf].filetype == "markdown" then
          require("ibl").setup_buffer(event.buf, {
            enabled = false,
          })
        end
      end,
    })

    vim.api.nvim_create_autocmd("ModeChanged", {
      pattern = "*:n",
      callback = function(event)
        if vim.bo[event.buf].filetype == "markdown" then
          require("ibl").setup_buffer(event.buf, {
            enabled = false,
          })
        end
      end,
    })

    vim.api.nvim_create_autocmd("ModeChanged", {
      pattern = "n:*",
      callback = function(event)
        if vim.bo[event.buf].filetype == "markdown" then
          require("ibl").setup_buffer(event.buf, {
            enabled = true,
          })
        end
      end,
    })
    require("ibl").setup({
      debounce = 80,
      indent = {
        char = "│",
      },
      scope = {
        enabled = false,
      },
    })

    require("ibl").overwrite({
      exclude = {
        filetypes = vim.g.special_filetypes,
        buftypes = vim.g.special_buftypes,
      },
    })
  end,
}
