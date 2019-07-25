#!/bin/bash

# dependencies
sudo apt install -y zsh fonts-powerline

# vars
user=`whoami`
zsh=`which zsh`

# shell configure
sudo chsh -s $zsh $user

# links
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig

ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/zsh/powerlevel10k zsh/oh-my-zsh/custom/themes
ln -s ~/.dotfiles/zsh/zsh-autosuggestions zsh/oh-my-zsh/custom/plugins
ln -s ~/.dotfiles/zsh/zsh-history-substring-search zsh/oh-my-zsh/custom/plugins
