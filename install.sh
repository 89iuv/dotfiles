#!/bin/bash

# dependencies
sudo apt install -y zsh fonts-powerline

# vars
user=`whoami`
zsh=`which zsh`

# shell configure
sudo chsh -s $zsh $user

# links
ln -s git/.gitconfig ~/.gitconfig

ln -s zsh/.zshrc ~/.zshrc
ln -s zsh/powerlevel10k zsh/oh-my-zsh/custom/themes
ln -s zsh/zsh-autosuggestions zsh/oh-my-zsh/custom/plugins

