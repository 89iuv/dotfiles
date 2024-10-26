#!/bin/bash

# vars
dotfiles_path=$(pwd)

# generic
brew install neofetch
brew install wget
brew install zoxide eza fz
brew install ripgrep fd

# bat
brew install bat
mkdir -p "$(bat --config-dir)/themes"
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Latte.tmTheme
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Frappe.tmTheme
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Macchiato.tmTheme
wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme
bat cache --build

# btop
brew install btop
ln -s "$dotfiles_path"/btop/themes/*.theme ~/.config/btop/themes/

# lua
brew install lua

# java
brew install java maven

# java: jenv
# https://www.jenv.be
brew install jenv

# python
brew install python pipx

# python pyenv
brew install pyenv
ln -s ~/.pyenv/bin/pyenv ~/.local/bin/

# python: poetry
pipx install poetry
mkdir "$ZSH_CUSTOM/plugins/poetry"
poetry completions zsh >"$ZSH_CUSTOM/plugins/poetry/_poetry"

# node: nvm
# https://github.com/nvm-sh/nvm
PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash'
nvm install node
nvm alias default node

# configure
# oh-my-zsh
ln -s "$dotfiles_path"/zsh/oh-my-zsh ~/.oh-my-zsh
ln -s "$dotfiles_path"/zsh/.zshrc ~/.zshrc

# zsh-autosuggestions
ln -s "$dotfiles_path"/zsh/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins

# powerlevel10k
ln -s "$dotfiles_path"/zsh/powerlevel10k ~/.oh-my-zsh/custom/themes
ln -s "$dotfiles_path"/zsh/.p10k.zsh ~/.p10k.zsh

# starship
curl -sS https://starship.rs/install.sh | sh
mkdir -p ~/.config/starship/
ln -s "$dotfiles_path"/zsh/starship/starship.toml ~/.config/starship/

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
git config --global delta.navigate true
git config --global delta.true-color always
git config --global delta.syntax-theme "Catppuccin Macchiato"
git config --global delta.side-by-side false
git config --global delta.line-numbers true
git config --global delta.file-decoration-style ul
git config --global delta.hunk-header-style omit
git config --global delta.features catppuccin-macchiato
git config --global interactive.diffFilter "delta --color-only"
git config --global merge.conflictstyle diff3
git config --global diff.colorMoved default
git config --global include.path ~/.dotfiles/git/delta/catppuccin.gitconfig
git config --global diffs "-c delta.side-by-side=true diff"

# lazygit
brew install lazygit
mkdir -p ~/.config/lazygit
ln -s "$dotfiles_path"/git/lazygit/config.yml ~/.config/lazygit/config.yml

# Other Fixes and Workarounds
# Fix for tmux adding double entries in PATH
# One thing I see people do is to change /etc/zprofile, adding one line to empty PATH:
# if [ -x /usr/libexec/path_helper ]; then
#     PATH=""  #empty the PATH
#     eval `/usr/libexec/path_helper -s`
# fi
# fix macos path: https://jdhao.github.io/2023/06/12/macos_path_changed_inside_tmux/
