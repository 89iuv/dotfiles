#!/bin/bash

# dependencies
sudo apt install -y zsh

# vars
path=`pwd`
user=`whoami`
zsh=`which zsh`

# shell configure
sudo chsh -s $zsh $user

# links
ln -s $path/zsh/oh-my-zsh ~/.oh-my-zsh
ln -s $path/zsh/powerlevel10k zsh/oh-my-zsh/custom/themes
ln -s $path/zsh/zsh-autosuggestions zsh/oh-my-zsh/custom/plugins
ln -s $path/zsh/zsh-history-substring-search zsh/oh-my-zsh/custom/plugins


ln -s $path/git/.gitconfig ~/.gitconfig

ln -s $path/zsh/.zshrc ~/.zshrc
ln -s $path/zsh/.p10k.zsh ~/.p10k.zsh

ln -s $path/vim/.vimrc ~/.vimrc
ln -s $path/vim/.vim ~/.vim

ln -s $path/tmux/.tmux.conf ~/.tmux.conf

