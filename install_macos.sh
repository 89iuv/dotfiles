#!/bin/bash

# dependencies
brew install neofetch htop wget node nvim ripgrep tmux lua tree fzf fd

# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm/tpm

# fzf
/opt/homebrew/opt/fzf/install

# vars
path=`pwd`

# links
ln -s $path/zsh/oh-my-zsh ~/.oh-my-zsh
ln -s $path/zsh/powerlevel10k ~/.oh-my-zsh/custom/themes
ln -s $path/zsh/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins
ln -s $path/zsh/zsh-history-substring-search ~/.oh-my-zsh/custom/plugins
ln -s $path/zsh/.zshrc ~/.zshrc
ln -s $path/zsh/.p10k.zsh ~/.p10k.zsh
ln -s $path/zsh/.fzf.zsh ~/.fzf.zsh

ln -s $path/tmux/.tmux.conf ~/.tmux.conf

mkdir -p ~/.config
ln -s $path/nvim ~/.config/nvim
