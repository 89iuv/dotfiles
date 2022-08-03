#!/bin/bash

echo "install and configure ubuntu dependencies"

# dependencies
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo add-apt-repository ppa:neovim-ppa/stable

sudo apt-get update
sudo apt-get install -y wget curl zsh neovim ripgrep build-essential nodejs unzip tar gzip neofetch fd-find

# vars
user=`whoami`
zsh=`which zsh`

# shell configure
sudo chsh -s $zsh $user


echo "create links for config files"

# vars
path=`pwd`

# links
ln -s $path/zsh/oh-my-zsh ~/.oh-my-zsh
ln -s $path/zsh/powerlevel10k zsh/oh-my-zsh/custom/themes
ln -s $path/zsh/zsh-autosuggestions zsh/oh-my-zsh/custom/plugins
ln -s $path/zsh/zsh-history-substring-search zsh/oh-my-zsh/custom/plugins
ln -s $path/zsh/.zshrc ~/.zshrc
ln -s $path/zsh/.p10k.zsh ~/.p10k.zsh

ln -s $path/tmux/.tmux.conf ~/.tmux.conf

mkdir -p ~/.config/nvim/
ln -s $path/nvim ~/.config/nvim

