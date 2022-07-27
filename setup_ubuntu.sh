#!/bin/bash

echo "install and configure ubuntu dependencies"

# dependencies
sudo add-apt-repository ppa:neovim-ppa/stable

sudo apt-get update
sudo apt-get install -y wget curl zsh neovim ripgrep build-essential npm unzip neofetch

# vars
user=`whoami`
zsh=`which zsh`

# shell configure
sudo chsh -s $zsh $user
