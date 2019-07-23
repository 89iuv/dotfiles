#!/bin/bash

# create dot links
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc

# link theme to oh-my-zsh
ln -s ~/.dotfiles/zsh/powerlevel10k ~/.dotfiles/zsh/oh-my-zsh/custom/themes

# link plugins to oh-my-zsh
ln -s ~/.dotfiles/zsh/zsh-autosuggestions ~/.dotfiles/zsh/oh-my-zsh/custom/plugins
