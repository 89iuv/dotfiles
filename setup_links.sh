#!/bin/bash

echo "create links for config files"

# vars
path=`pwd`

# links
ln -s $path/git/.gitconfig ~/.gitconfig

ln -s $path/zsh/oh-my-zsh ~/.oh-my-zsh
ln -s $path/zsh/powerlevel10k zsh/oh-my-zsh/custom/themes
ln -s $path/zsh/zsh-autosuggestions zsh/oh-my-zsh/custom/plugins
ln -s $path/zsh/zsh-history-substring-search zsh/oh-my-zsh/custom/plugins
ln -s $path/zsh/.zshrc ~/.zshrc
ln -s $path/zsh/.p10k.zsh ~/.p10k.zsh

ln -s $path/tmux/.tmux.conf ~/.tmux.conf

ln -s $path/nvim ~/.config/nvim

