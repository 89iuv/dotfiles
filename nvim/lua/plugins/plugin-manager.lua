vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugin-manager.lua source <afile> | PackerCompile
  augroup end
]])

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup({
  function(use)
    -- Packer can manage itself
    use { 'wbthomason/packer.nvim' }
    use { 'folke/which-key.nvim', config = [[require'plugins.configs.which-key']] }

    -- Themes
    use { 'catppuccin/nvim', as = 'catppuccin', config = [[require'plugins.configs.catppuccin']] }

    -- Components
    use { 'famiu/bufdelete.nvim' }
    use { 'akinsho/bufferline.nvim', tag = '*', requires = {'kyazdani42/nvim-web-devicons'}, config = [[require'plugins.configs.bufferline']] }
    use { 'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'}, config = [[require'plugins.configs.nvim-tree']] }
    use { 'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons'}, config = [[require'plugins.configs.lualine']] }
    use { 'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}, config = [[require'plugins.configs.telescope']] }

    -- Code
    use { 'nvim-treesitter/nvim-treesitter', run = function() require('nvim-treesitter.install').update({ with_sync = true }) end, config = [[require'plugins.configs.nvim-treesitter']] }
    use { 'lukas-reineke/indent-blankline.nvim', config = [[require'plugins.configs.indent-blankline']] }
    use { 'windwp/nvim-autopairs', config = [[require'plugins.configs.nvim-autopairs']] }
    use { 'terrortylor/nvim-comment', config = [[require'plugins.configs.nvim-comment']] }

    -- Snippet
    use { 'L3MON4D3/LuaSnip', config = [[require('luasnip.loaders.from_vscode').lazy_load()]] }
    use { 'rafamadriz/friendly-snippets' }

    -- Autocomplete
    use { 'hrsh7th/nvim-cmp', config = [[require'plugins.configs.nvim-cmp']] }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'onsails/lspkind.nvim' }

    -- LSP
    use { 'neovim/nvim-lspconfig' }
    use { 'williamboman/mason.nvim', config = [[require'plugins.configs.mason']] }
    use { 'williamboman/mason-lspconfig.nvim', config = [[require'plugins.configs.mason-lspconfig']] }

    -- Git
    use { 'lewis6991/gitsigns.nvim', config = [[require'plugins.configs.gitsigns']] }

    -- Usability
    use { 'Pocco81/auto-save.nvim', config = [[require'plugins.configs.auto-save']] }


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
