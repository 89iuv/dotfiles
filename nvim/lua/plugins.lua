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

    use {'feline-nvim/feline.nvim'}
    use {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}

    use {"lukas-reineke/indent-blankline.nvim"}
    use {"folke/which-key.nvim"}
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}
    use {'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} }}
    use {'lewis6991/gitsigns.nvim'}
    use {'Pocco81/AutoSave.nvim'}

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
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end ]])
