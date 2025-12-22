#!/bin/bash

# System
# update installed packages and repositories
sudo dnf -y update

# install development tools: git, c compiler, make, etc
sudo dnf -y group install c-development development-tools

# enable rpm fusion free
sudo dnf -y install \
https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-"$(rpm -E %fedora)".noarch.rpm
sudo dnf -y install \
https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-"$(rpm -E %fedora)".noarch.rpm

# install dependencies
sudo dnf -y install \
xclip xsel wl-clipboard \
git-delta \
zsh zoxide bat fzf ripgrep fd jq stow \
curl wget lynx \
chafa ImageMagick \
lua luarocks compat-lua \
tmux neovim btop \
stress hyperfine \
fastfetch

# install lazygit
sudo dnf copr enable -y atim/lazygit
sudo dnf install -y lazygit

# install python
sudo dnf install -y python pip uv

# install nodejs
sudo dnf install -y node

# install java
sudo dnf install -y java-latest-openjdk maven

# install docker
sudo dnf config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# clean up
sudo dnf clean all

# Tools
# install eza
curl -fsSL https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz \
| tar xz
chmod +x eza
chown root:root eza
sudo mv eza /usr/local/bin/eza

# Integations
# build integrations
~/.dotfiles/catppuccin-bat/build.sh
~/.dotfiles/catppuccin-delta/build.sh
~/.dotfiles/catppuccin-btop/build.sh
~/.dotfiles/catppuccin-zsh-syntax-highlighting/build.sh

# symlink integrations
for path in "$HOME"/.dotfiles/*/; do stow -t "$HOME" -d "$HOME"/.dotfiles/ "$(basename "$path")"; done

# install integrations
~/.dotfiles/catppuccin-bat/install.sh
~/.dotfiles/catppuccin-delta/install.sh
~/.dotfiles/tmux/install.sh
~/.dotfiles/nvim/install.sh
~/.dotfiles/docker/install.sh

# User
# change shell to zsh
sudo chsh -s /usr/bin/zsh "$USER"

# replace shell with new one
exec zsh --login
