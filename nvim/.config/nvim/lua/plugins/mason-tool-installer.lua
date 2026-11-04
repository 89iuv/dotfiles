return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  cmd = {
    "MasonToolsInstall",
    "MasonToolsInstallSync",
    "MasonToolsUpdate",
    "MasonToolsUpdateSync",
    "MasonToolsClean",
  },
  lazy = false, -- this needs to run at startup in order to auto install packages
  config = function()
    local languages = require("config.global").languages

    local ensure_installed = {}
    for _, plugins in pairs(languages) do
      local mason_tool_installer = plugins.mason_tool_installer ~= nil and plugins.mason_tool_installer or {}
      for _, tool in ipairs(mason_tool_installer) do
        table.insert(ensure_installed, tool)
      end
    end

    require("mason-tool-installer").setup({
      ensure_installed = ensure_installed
    })
  end,
}
