return {
  "mfussenegger/nvim-jdtls",
  opts = {
    -- others
    jdtls = {
      handlers = {
        -- disable messages from jdtls because they are noisy
        ["language/status"] = function(_, result, ctx)
          local client = vim.lsp.get_client_by_id(ctx.client_id)

          local type = result.type
          local message = not string.find(result.message, type) and string.format("**%s**", result.message) or ""
          local msg = type .. " " .. message
          local name = client and client.name or ""

          vim.notify(msg, vim.log.levels.INFO, {
            id = "lsp_progress",
            title = name,
          })
        end,
      },
    },
  },
}
