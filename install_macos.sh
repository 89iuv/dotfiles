#!/bin/bash

# dependencies
brew install neofetch onefetch btop dust wget nvim ripgrep tmux lua fzf fd eza bat

# nvchad
git clone git@github.com:89iuv/starter.git ~/.config/nvim && nvim
# run :MasonInstallAll

# node
# https://github.com/nvm-sh/nvm
PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash'
nvm install node
nvm alias default node

# vars
dotfiles_path=`pwd`

# configure
# oh-my-zsh
ln -s $dotfiles_path/zsh/oh-my-zsh ~/.oh-my-zsh
ln -s $dotfiles_path/zsh/.zshrc ~/.zshrc

# zsh-autosuggestions
ln -s $dotfiles_path/zsh/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins

# powerlevel10k
ln -s $dotfiles_path/zsh/powerlevel10k ~/.oh-my-zsh/custom/themes
ln -s $dotfiles_path/zsh/.p10k.zsh ~/.p10k.zsh

# tmux
ln -s $dotfiles_path/tmux/.tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# fzf
$(brew --prefix)/opt/fzf/install
