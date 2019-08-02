#!/bin/bash

# dependencies
sudo apt install -y zsh fonts-powerline

# vars
path=`pwd`
user=`whoami`
zsh=`which zsh`

# shell configure
sudo chsh -s $zsh $user

# links
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig

ln -s $path/zsh/.zshrc ~/.zshrc
ln -s $path/zsh/powerlevel10k zsh/oh-my-zsh/custom/themes
ln -s $path/zsh/zsh-autosuggestions zsh/oh-my-zsh/custom/plugins
ln -s $path/zsh/zsh-history-substring-search zsh/oh-my-zsh/custom/plugins
