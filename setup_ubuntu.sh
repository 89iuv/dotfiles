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
