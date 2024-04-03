-- generate a function to detect the os
local jdtls_config
local os_name = vim.loop.os_uname().sysname
if os_name == 'Darwin' then
  jdtls_config = 'config_mac'
elseif os_name == 'Linux' then
  jdtls_config = 'config_linux'
else
  jdtls_config = 'config_win'
end

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {
    'java', -- or '/path/to/java17_or_newer/bin/java'

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '-javaagent:' .. vim.fn.expand '~/.local/share/nvim/mason/packages/jdtls/lombok.jar',
    '--add-modules=ALL-SYSTEM',
    '--add-opens',
    'java.base/java.util=ALL-UNNAMED',
    '--add-opens',
    'java.base/java.lang=ALL-UNNAMED',

    '-jar',
    vim.fn.expand '~/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.700.v20231214-2017.jar',

    '-configuration',
    vim.fn.expand '~/.local/share/nvim/mason/packages/jdtls/' .. jdtls_config,

    '-data',
    vim.fn.expand '~/.cache/jdtls/workspace' .. '/' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t'),
  },

  root_dir = require('jdtls.setup').find_root { '.git', 'mvnw', 'pom.xml', 'gradlew', 'settings.gradle', 'build.gradle' },

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {},
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {},
  },
}

require('jdtls').start_or_attach(config)
