#!/bin/bash

# dependencies
brew install neofetch onefetch htop wget node nvim ripgrep tmux lua fzf fd exa bat

# vars
dotfiles_path=`pwd`

# configure
# oh-my-zsh
ln -s $dotfiles_path/zsh/oh-my-zsh ~/.oh-my-zsh
ln -s $dotfiles_path/zsh/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins
ln -s $dotfiles_path/zsh/.zshrc ~/.zshrc

# powerlevel10k
ln -s $dotfiles_path/zsh/powerlevel10k ~/.oh-my-zsh/custom/themes
ln -s $dotfiles_path/zsh/.p10k.zsh ~/.p10k.zsh

# tmux
ln -s $dotfiles_path/tmux/.tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# nvim
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
ln -s $dotfiles_path/nvchad/custom ~/.config/nvim/lua

# fzf
$(brew --prefix)/opt/fzf/install

# bat
mkdir -p "$(bat --config-dir)/themes"
ln -s $dotfiles_path/zsh/bat/*.tmTheme ~/.config/bat/themes
bat cache --build
