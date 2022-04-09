#!/bin/bash

# dependencies
sudo add-apt-repository ppa:neovim-ppa/stable

sudo apt-get update
sudo apt-get install -y zsh neovim


# vars
path=`pwd`
user=`whoami`
zsh=`which zsh`

# shell configure
sudo chsh -s $zsh $user

