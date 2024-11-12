return {
  "mfussenegger/nvim-jdtls",
  opts = {
    -- others
    jdtls = {
      handlers = {
        -- disable messages from jdtls because they are noisy
        ["language/status"] = function(_, _) end,
      },
    },
  },
}
