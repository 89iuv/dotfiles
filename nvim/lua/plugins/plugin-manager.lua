vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugin-manager.lua source <afile> | PackerCompile
  augroup end
]])

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git',  'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

function load_plugin_config(name)
  local status, err = pcall(require, 'plugins.configs.'..name)
  if (not status) then
    print("WARN: Unable to load plugin "..name..".")
    print(err)
    return
  end
end

return require('packer').startup({
  function(use)
    -- Packer can manage itself
    use { 'wbthomason/packer.nvim' }
    use { 'folke/which-key.nvim', config = [[load_plugin_config'which-key']] }

    -- Themes
    use { 'catppuccin/nvim', as = 'catppuccin', config = [[load_plugin_config'catppuccin']] }

    -- Components
    use { 'famiu/bufdelete.nvim' }
    use { 'akinsho/bufferline.nvim', tag = 'v3.*', requires = {'kyazdani42/nvim-web-devicons'}, after = "catppuccin", config = [[load_plugin_config('bufferline')]] }
    use { 'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'}, config = [[load_plugin_config'nvim-tree']] }
    use { 'feline-nvim/feline.nvim', config = [[load_plugin_config'feline']]}
    use { 'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}, config = [[load_plugin_config'telescope']] }

    -- Code
    use { 'nvim-treesitter/nvim-treesitter', run = function() require('nvim-treesitter.install').update({ with_sync = true }) end, config = [[load_plugin_config'nvim-treesitter']] }
    use { 'lukas-reineke/indent-blankline.nvim', config = [[load_plugin_config'indent-blankline']] }
    use { 'windwp/nvim-autopairs', config = [[load_plugin_config'nvim-autopairs']] }
    use { 'terrortylor/nvim-comment', config = [[load_plugin_config'nvim-comment']] }

    -- Snippet
    use { 'L3MON4D3/LuaSnip', config = [[load_plugin_config'luasnip']] }
    use { 'rafamadriz/friendly-snippets' }

    -- Autocomplete
    use { 'hrsh7th/nvim-cmp', config = [[load_plugin_config'nvim-cmp']] }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'onsails/lspkind.nvim' }

    -- LSP
    use { 'neovim/nvim-lspconfig' }
    use { 'williamboman/mason.nvim', config = [[load_plugin_config'mason']] }
    use { 'williamboman/mason-lspconfig.nvim', config = [[load_plugin_config'mason-lspconfig']] }

    -- Git
    use { 'lewis6991/gitsigns.nvim', config = [[load_plugin_config'gitsigns']] }

    -- Usability
    use { 'Pocco81/auto-save.nvim', config = [[load_plugin_config'auto-save']] }


    -- Automatically set up your configuration after cloning packer.nvim
    if packer_bootstrap then
      require('packer').sync()
    end
  end,

  config = {
    auto_reload_compiled = false, -- Automatically reload the compiled file after creating it.
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
})

-- run bootstrap: nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
