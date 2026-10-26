return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
  },
  config = function()
    -- load icons from global config
    local icons = require("config.global").icons

    --lsp diagnostics configuration
    vim.diagnostic.config({
      update_in_insert = false,
      severity_sort = true,
      underline = {
        severity = {
          min = vim.diagnostic.severity.INFO,
        },
      },
      float = {
        source = true,
      },
      virtual_text = {
        source = false, -- it is handeled in the format function
        prefix = "■",
        severity = {
          min = vim.diagnostic.severity.WARN,
        },
        format = function(diagnostic)
          local code = diagnostic.code
		  local message = string.match(diagnostic.message, "^[^\r\n]*")
		  local source = diagnostic.source

		  local text = ""
		  text = code ~= nil and text .. code .. ": " or ""
		  text = message ~= nil and text .. message or ""
		  text = source ~= nil and text .. " [".. source .."]" or ""

		  return text
        end,
      },

      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = icons.diagnostics.error,
          [vim.diagnostic.severity.WARN] = icons.diagnostics.warn,
          [vim.diagnostic.severity.INFO] = icons.diagnostics.info,
          [vim.diagnostic.severity.HINT] = icons.diagnostics.hint,
        },
      },
    })

    -- keymaps
    vim.keymap.set("n", "K", function()
      vim.lsp.buf.hover({
        max_width = 80,
        max_height = 20,
        border = "single",
      })
    end, { desc = "LSP Hover Documentation" })

    --settings
    vim.lsp.inlay_hint.enable(true)
    vim.lsp.config("*", {
      capabilities = {
        workspace = {
          didChangeWatchedFiles = { dynamicRegistration = true },
        },
      },
    })

    -- lua
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          hint = {
            enable = true, -- Core setting to turn hints on
            arrayIndex = "Disable", -- Optional: Show index hints for arrays
          },
        },
      },
    })
    vim.lsp.enable("lua_ls")

    -- python
    vim.lsp.config("basedpyright", {
      settings = {
        basedpyright = {
          disableOrganizeImports = true, -- Ruff does this
        },
      },
    })
    vim.lsp.enable("basedpyright")

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.name == "ruff" then
          client.server_capabilities.hoverProvider = false
        end
      end,
    })
    vim.lsp.config("ruff", {
      init_options = {
        settings = {
          configuration = vim.fn.expand("~/.dotfiles/templates/ruff.toml"),
          configurationPreference = "filesystemFirst",
        },
      },
    })
    vim.lsp.enable("ruff")
  end,
}
