M = {}

M.exclude = {
  filetypes = {
    "neo-tree",
    "snacks_dashboard",
    "snacks_input",
    "snacks_picker_preview",
    "markdown.snacks_picker_preview",
  },
}

M.border = "single"

M.icons = {
  diagnostics = {
    hint = "",
    info = "",
    warn = "",
    error = "",
  },
  diagnostics_outline = {
    hint = "",
    info = "",
    warn = "",
    error = "",
  },
  git = {
    added = "+",
    modified = "~",
    removed = "-",
  },
}

M.languages = {
  lua = {
    mason_tool_installer = { "lua-language-server", "stylua" },
    nvim_lspconfig = {
      lua_ls = {
        settings = {
          Lua = {
            hint = {
              enable = true, -- Core setting to turn hints on
              arrayIndex = "Disable", -- Optional: Show index hints for arrays
            },
          },
        },
      },
    },
    conform = { lua = { "stylua" } },
    nvim_treesitter = { "lua" },
  },
  python = {
    mason_tool_installer = { "basedpyright", "ruff" },
    nvim_lspconfig = {
      basedpyright = {
        settings = {
          basedpyright = {
            disableOrganizeImports = true, -- Ruff does this
            analysis = {
              typeCheckingMode = "recommended",
              diagnosticMode = "openFilesOnly",
              -- Ignore all files for analysis to exclusively use Ruff for linting
              ignore = { "*" },
            },
          },
        },
      },
      ruff = {},
    },
    autocmd = function()
      vim.api.nvim_create_autocmd("LspAttach", {
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
      })
    end,
    conform = { python = { "ruff_format" } },
    nvim_treesitter = { "python" },
  },
  bash = {
    mason_tool_installer = { "bash-language-server", "shellcheck", "shfmt" },
    nvim_lspconfig = { bashls = {} },
    nvim_treesitter = { "bash", "diff" },
  },
  markdown = {
    mason_tool_installer = { "marksman", "markdownlint-cli2", "markdown-toc", "prettier" },
    nvim_lspconfig = { marksman = {} },
    nvim_lint = { markdown = { "markdownlint-cli2" } },
    conform = { markdown = { "prettier", "markdownlint-cli2", "markdown-toc" } },
    nvim_treesitter = { "markdown", "markdown_inline" },
  },
  docker = {
    mason_tool_installer = { "dockerfile-language-server", "hadolint", "dockerfmt" },
    nvim_lspconfig = { dockerls = {} },
    nvim_lint = { dockerfile = { "hadolint" } },
    conform = { dockerfile = { "dockerfmt" } },
    nvim_treesitter = { "dockerfile" },
  },
  toml = {
    mason_tool_installer = { "taplo" },
    nvim_lspconfig = { taplo = {} },
    nvim_treesitter = { "toml" },
  },
  json = {
    mason_tool_installer = { "json-lsp" },
    nvim_lspconfig = { jsonls = {} },
    conform = {
      json = { "prettier" },
      jsonc = { "prettier" },
    },
    nvim_treesitter = { "json" },
  },
  yaml = {
    mason_tool_installer = { "yaml-language-server", "yamllint" },
    nvim_lspconfig = { yamlls = {} },
    nvim_lint = { yaml = { "yamllint" } },
    conform = { yaml = { "prettier" } },
    nvim_treesitter = { "yaml" },
  },
}

return M
