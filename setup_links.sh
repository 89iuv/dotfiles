#!/bin/bash

# vars
path=`pwd`

# links
ln -s $path/zsh/oh-my-zsh ~/.oh-my-zsh
ln -s $path/zsh/powerlevel10k zsh/oh-my-zsh/custom/themes
ln -s $path/zsh/zsh-autosuggestions zsh/oh-my-zsh/custom/plugins
ln -s $path/zsh/zsh-history-substring-search zsh/oh-my-zsh/custom/plugins


ln -s $path/git/.gitconfig ~/.gitconfig

ln -s $path/zsh/.zshrc ~/.zshrc
ln -s $path/zsh/.p10k.zsh ~/.p10k.zsh

mkdir -p ~/.config/nvim
ln -s $path/nvim/init.vim ~/.config/nvim/init.vim

ln -s $path/tmux/.tmux.conf ~/.tmux.conf

