#!/bin/bash

# generic
brew install neofetch btop tree dust ripgrep fd eza zoxide bat wget onefetch

# lua
brew install lua

# java
brew install java maven kafka

# python
brew install python pipx

# python poetry
pipx install poetry
mkdir "$ZSH_CUSTOM/plugins/poetry"
poetry completions zsh >"$ZSH_CUSTOM/plugins/poetry/_poetry"

# jenv
# https://www.jenv.be
brew install jenv

# node
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

# zsh-history-substring-search
ln -s "$dotfiles_path"/zsh/zsh-history-substring-search ~/.oh-my-zsh/custom/plugins

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

# fzf
brew install fzf
"$(brew --prefix)/opt/fzf/install"

# bat
brew install bat
mkdir -p "$(bat --config-dir)/themes"
ln -s "$dotfiles_path"/zsh/bat/themes/*.tmTheme ~/.config/bat/themes
bat cache --build

# delta
brew install git-delta
git config --global --add include.path "$dotfiles_path"/zsh/delta/catppuccin.gitconfig
git config --global core.pager delta
git config --global delta.features catppuccin-mocha
git config --global delta.side-by-side true
git config --global delta.true-color always
git config --global delta.hunk-header-style omit

# btop
brew install btop
ln -s /Users/valiuv/.dotfiles/zsh/btop/themes/catppuccin_* ~/.config/btop/themes
