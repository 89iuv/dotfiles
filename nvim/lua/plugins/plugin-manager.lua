local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup({
  function(use)
    -- My plugins here
    use {'wbthomason/packer.nvim'} -- Packer can manage itself

    use {'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'}} -- optional, for file icon
    use {'akinsho/bufferline.nvim', tag = "*", requires = 'kyazdani42/nvim-web-devicons'}
    use {'famiu/bufdelete.nvim'}
    use {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
    use {"lukas-reineke/indent-blankline.nvim"}
    use {'nvim-telescope/telescope.nvim', tag ="nvim-0.6", requires = { {'nvim-lua/plenary.nvim'} }}
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {"terrortylor/nvim-comment"}
    use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}
    use {'lewis6991/gitsigns.nvim'}
    use {'Pocco81/AutoSave.nvim'}
    use {"folke/which-key.nvim"}

    use {'hrsh7th/nvim-cmp'}
    use {'hrsh7th/cmp-nvim-lsp'}
    use {'hrsh7th/cmp-buffer'}
    use {'hrsh7th/cmp-path'}

    use {'L3MON4D3/LuaSnip'}
    use {'saadparwaiz1/cmp_luasnip'}

    use {'onsails/lspkind.nvim'}

    -- My themes here
    use {"catppuccin/nvim", as = "catppuccin"} -- nvim theme

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end
  end,

  -- Run packer in a floating window
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
})

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugin-manager.lua source <afile> | PackerCompile
  augroup end 
]])

-- Configur Plugins
require"plugins.configs.nvim-tree"
require"plugins.configs.bufferline"
require"plugins.configs.lualine"
require"plugins.configs.indent-blankline"
require"plugins.configs.telescope"
require"plugins.configs.nvim-treesitter"
require"plugins.configs.nvim-comment"
require"plugins.configs.nvim-lsp-installer"
require"plugins.configs.gitsigns"
require"plugins.configs.autosave"
require"plugins.configs.which-key"

require"plugins.configs.nvim-cmp"

-- Configure Themes
require"plugins.configs.catppuccin"

