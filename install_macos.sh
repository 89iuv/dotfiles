#!/bin/bash

# dependencies
brew install neofetch htop wget node nvim ripgrep tmux lua fzf fd exa bat

# vars
path=`pwd`

# configure
# oh-my-zsh
ln -s $path/zsh/oh-my-zsh ~/.oh-my-zsh
ln -s $path/zsh/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins
ln -s $path/zsh/zsh-history-substring-search ~/.oh-my-zsh/custom/plugins
ln -s $path/zsh/.zshrc ~/.zshrc

# powerlevel10k
ln -s $path/zsh/powerlevel10k ~/.oh-my-zsh/custom/themes
ln -s $path/zsh/.p10k.zsh ~/.p10k.zsh

# tmux
ln -s $path/tmux/.tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# nvim
mkdir -p ~/.config
ln -s $path/nvim ~/.config/nvim

# fzf
$(brew --prefix)/opt/fzf/install

# bat
mkdir -p "$(bat --config-dir)/themes"
ln -s $path/zsh/bat/*.tmTheme ~/.config/bat/themes
bat cache --build
