return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "saghen/blink.cmp",
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    vim.api.nvim_create_autocmd("ModeChanged", {
      pattern = "*:n",
      callback = function(event)
        vim.diagnostic.enable(true, { bufnr = event.buf })
      end,
    })

    vim.api.nvim_create_autocmd("ModeChanged", {
      pattern = "n:*",
      callback = function(event)
        vim.diagnostic.enable(false, { bufnr = event.buf })
      end,
    })

    -- load icons from global config
    local icons = require("config.global").icons

    -- lsp diagnostics configuration
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
        border = "single",
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
          text = code ~= nil and text .. code .. ": " or text
          text = message ~= nil and text .. message or text
          text = source ~= nil and text .. " [" .. source .. "]" or text

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

    vim.keymap.set("i", "<C-S>", function()
      vim.lsp.buf.signature_help({
        max_height = 20,
        max_width = 80,
        border = "single",
      })
    end, { desc = "LSP Signature Help" })

    vim.keymap.set("n", "<leader>ca", function()
      vim.lsp.buf.code_action()
    end, { desc = "Code Action" })

    vim.keymap.set("n", "<leader>co", function()
      vim.lsp.buf.code_action({
        apply = true,
        context = {
          only = { "source.organizeImports" },
          diagnostics = {},
        },
      })
    end, { desc = "Organize Imports" })

    vim.keymap.set("n", "<leader>cr", function()
      vim.lsp.buf.rename()
    end, { desc = "Rename" })

    -- settings
    local capabilities = vim.tbl_deep_extend(
      "force",
      vim.lsp.protocol.make_client_capabilities(),
      require("blink.cmp").get_lsp_capabilities()
    )
    capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
    capabilities.general.positionEncodings = { "utf-16" }

    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp_attach_disable_ruff_hover", { clear = true }),
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client == nil then
          return
        end
        if client.name == "ruff" then
          -- Disable hover in favor of Pyright
          client.server_capabilities.hoverProvider = false
        end
      end,
      desc = "LSP: Disable hover capability from Ruff",
    })

    vim.lsp.inlay_hint.enable(true)

    -- servers
    local languages = require("config.global").languages

    for _, plugins in pairs(languages) do
      local nvim_lspconfig = plugins.nvim_lspconfig ~= nil and plugins.nvim_lspconfig or {}
      for name, config in pairs(nvim_lspconfig) do
        vim.lsp.config(name, config)
        vim.lsp.enable(name)
      end
    end
  end,
}
