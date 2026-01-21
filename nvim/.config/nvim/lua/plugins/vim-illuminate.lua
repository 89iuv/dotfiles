return {
  "RRethy/vim-illuminate",
  event = "LazyFile",
  opts = {
    delay = 160,
    large_file_cutoff = 2000,
    large_file_overrides = {
      providers = { "lsp" },
    },
    filetypes_denylist = {
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
      },
    modes_allowlist = { "n" },
  },
  config = function(_, opts)
    require("illuminate").configure(opts)

    Snacks.toggle({
      name = "Illuminate",
      get = function()
        return not require("illuminate.engine").is_paused()
      end,
      set = function(enabled)
        local m = require("illuminate")
        if enabled then
          m.resume()
        else
          m.pause()
        end
      end,
    }):map("<leader>ux")

    local function map(key, dir, buffer)
      vim.keymap.set("n", key, function()
        require("illuminate")["goto_" .. dir .. "_reference"](true)
      end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
    end

    map("]]", "next")
    map("[[", "prev")

    -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        local buffer = vim.api.nvim_get_current_buf()
        map("]]", "next", buffer)
        map("[[", "prev", buffer)
      end,
    })
  end,
  keys = {
    { "]]", desc = "Next Reference" },
    { "[[", desc = "Prev Reference" },
  },
}
