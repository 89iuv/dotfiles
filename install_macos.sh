#!/bin/bash

# generic
brew install neofetch
brew install wget
brew install zoxide eza fzf bat
brew install ripgrep fd

# lua
brew install lua

# java
brew install java maven

# java: jenv
# https://www.jenv.be
brew install jenv

# python
brew install python pipx pyenv

# python: poetry
pipx install poetry
mkdir "$ZSH_CUSTOM/plugins/poetry"
poetry completions zsh >"$ZSH_CUSTOM/plugins/poetry/_poetry"

# node: nvm
# https://github.com/nvm-sh/nvm
PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash'
nvm install node
nvm alias default node

# vars
dotfiles_path=$(pwd)

# configure
# oh-my-zsh
ln -s "$dotfiles_path"/zsh/oh-my-zsh ~/.oh-my-zsh
ln -s "$dotfiles_path"/zsh/.zshrc ~/.zshrc

# zsh-autosuggestions
ln -s "$dotfiles_path"/zsh/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins

# powerlevel10k
ln -s "$dotfiles_path"/zsh/powerlevel10k ~/.oh-my-zsh/custom/themes
ln -s "$dotfiles_path"/zsh/.p10k.zsh ~/.p10k.zsh

# tmux
brew install tmux
ln -s "$dotfiles_path"/tmux/.tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# nvim
brew install nvim
ln -s "$dotfiles_path"/nvim ~/.config/nvim

# delta
brew install git-delta
git config --global core.pager delta
git config --global delta.true-color always
git config --global delta.syntax-theme base16
git config --global delta.side-by-side false
git config --global delta.line-numbers true
git config --global delta.hunk-header-style omit
git config --global interactive.diffFilter delta --color-only
git config --global merge.conflictstyle diff3
git config --global diff.colorMoved default

# lazygit
brew install lazygit
# Note
# use documentation to integrate lazygit with delta
