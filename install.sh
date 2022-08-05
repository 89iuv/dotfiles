#!/bin/bash

echo "install ubuntu dependencies"

# dependencies
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo add-apt-repository ppa:neovim-ppa/stable

sudo apt-get update
sudo apt-get install -y wget curl zsh neovim ripgrep build-essential nodejs unzip tar gzip neofetch fd-find tree

echo "change shell from bash to zsh"

# vars
user=`whoami`
zsh=`which zsh`

# shell configure
sudo chsh -s $zsh $user

echo "create links for application config"

# vars
path=`pwd`

# links
ln -s $path/zsh/oh-my-zsh ~/.oh-my-zsh
ln -s $path/zsh/powerlevel10k ~/.oh-my-zsh/custom/themes
ln -s $path/zsh/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins
ln -s $path/zsh/zsh-history-substring-search ~/.oh-my-zsh/custom/plugins
ln -s $path/zsh/.zshrc ~/.zshrc
ln -s $path/zsh/.p10k.zsh ~/.p10k.zsh

ln -s $path/tmux/.tmux.conf ~/.tmux.conf

mkdir -p ~/.config
ln -s $path/nvim ~/.config/nvim

