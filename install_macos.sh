#!/bin/bash

# generic
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
ln -s "$HOME"/.dotfiles/btop/themes/*.theme "$HOME"/.config/btop/themes/

# lua
brew install lua

# java
brew install java maven

# java: jenv
# https://www.jenv.be
brew install jenv

# python
brew install python pipx

# python: pyenv
brew install pyenv
ln -s "$HOME"/.pyenv/bin/pyenv "$HOME"/.local/bin/

# python: poetry
pipx install poetry
mkdir "$ZSH_CUSTOM/plugins/poetry"
poetry completions zsh >"$ZSH_CUSTOM/plugins/poetry/_poetry"
poetry config virtualenvs.in-project true

# node: nvm
# https://github.com/nvm-sh/nvm
PROFILE=/dev/null bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash'
nvm install node
nvm alias default node

#fastfetch
brew install fastfetch
mkdir -p "$HOME"/.config/fastfetch
ln -s "$HOME"/.dotfiles/fastfetch/config.jsonc "$HOME"/.config/fastfetch

# oh-my-zsh
ln -s "$HOME"/.dotfiles/zsh/oh-my-zsh "$HOME"/.oh-my-zsh
ln -s "$HOME"/.dotfiles/zsh/.zshrc "$HOME"/.zshrc

# zsh-autosuggestions
ln -s "$HOME"/.dotfiles/zsh/zsh-autosuggestions "$HOME"/.oh-my-zsh/custom/plugins

# powerlevel10k
ln -s "$HOME"/.dotfiles/zsh/powerlevel10k "$HOME"/.oh-my-zsh/custom/themes
ln -s "$HOME"/.dotfiles/zsh/.p10k.zsh "$HOME"/.p10k.zsh

# evalcache
ln -s "$HOME"/.dotfiles/zsh/evalcache "$HOME"/.oh-my-zsh/custom/plugins

# tmux
brew install tmux
ln -s "$HOME"/.dotfiles/tmux/.tmux.conf "$HOME"/.tmux.conf
git clone https://github.com/tmux-plugins/tpm "$HOME"/.tmux/plugins/tpm

# nvim
brew install nvim
ln -s "$HOME"/.dotfiles/nvim "$HOME"/.config/nvim

# delta
brew install git-delta

git config --global core.pager delta
git config --global delta.navigate true
git config --global delta.true-color always
git config --global delta.syntax-theme "Catppuccin Macchiato"
git config --global delta.side-by-side false
git config --global delta.line-numbers true
git config --global delta.file-decoration-style "blue ul"
git config --global delta.file-style blue
git config --global delta.hunk-header-style omit
git config --global delta.features catppuccin-macchiato
git config --global interactive.diffFilter "delta --color-only"
git config --global merge.conflictstyle diff3
git config --global diff.colorMoved default
git config --global include.path "$HOME"/.dotfiles/git/delta/catppuccin.gitconfig
git config --global alias.diffs "-c delta.side-by-side=true diff"

# lazygit
brew install lazygit
mkdir -p "$HOME"/.config/lazygit
ln -s "$HOME"/.dotfiles/git/lazygit/config.yml "$HOME"/.config/lazygit/config.yml

# Other Fixes and Workarounds
# Fix for tmux adding double entries in PATH
# One thing I see people do is to change /etc/zprofile, adding one line to empty PATH:
# if [ -x /usr/libexec/path_helper ]; then
#     PATH=""  #empty the PATH
#     eval `/usr/libexec/path_helper -s`
# fi
# fix macos path: https://jdhao.github.io/2023/06/12/macos_path_changed_inside_tmux/
