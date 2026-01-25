#!/bin/bash
set -eo pipefail

# System
# update installed packages and repositories
sudo dnf -y update

# install development tools: git, c compiler, make, etc
sudo dnf -y group install c-development development-tools

# enable rpm fusion free and nonfree
sudo dnf -y install \
https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-"$(rpm -E %fedora)".noarch.rpm
sudo dnf -y install \
https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-"$(rpm -E %fedora)".noarch.rpm

# install multimedia: swap ffmpeg
sudo dnf -y swap ffmpeg-free ffmpeg --allowerasing

# install dependencies
sudo dnf -y install \
xclip xsel \
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

# install python: pyenv dependencies
sudo dnf install -y make gcc patch zlib-devel bzip2 bzip2-devel \
  readline-devel sqlite sqlite-devel openssl-devel tk8-devel \
  libffi-devel xz-devel libuuid-devel gdbm-libs libnsl2 libzstd-devel

# install nodejs
sudo dnf install -y node

# install java
sudo dnf install -y java-latest-openjdk maven

# install docker
sudo dnf config-manager addrepo --overwrite --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
mkdir -p ~/.oh-my-zsh/completions/
docker completion zsh > ~/.oh-my-zsh/completions/_docker
sudo usermod -aG docker "$USER"
# this works on local and ignored in docker container
sudo systemctl enable --now docker.service

# clean up
sudo dnf clean all

# Tools
# install eza
curl -fsSL https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz \
| tar xz
chmod +x eza
sudo chown root:root eza
sudo mv eza /usr/local/bin/eza

# install python: pyenv
rm -rf "$HOME"/.pyenv
curl -fsSL https://pyenv.run | bash
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init - bash)"
pyenv install 3
pyenv global 3

# install nodejs: fnm
rm -rf "$HOME"/.fnm
curl -fsSL https://fnm.vercel.app/install | bash -s -- --install-dir "$HOME/.fnm" --skip-shell
export PATH="$HOME/.fnm:$PATH"
eval "$(fnm env --use-on-cd --shell bash)"
mkdir -p ~/.oh-my-zsh/completions/
fnm completions --shell zsh > ~/.oh-my-zsh/completions/_fnm
fnm install 24

# install nodejs: npm: global pckages
npm install -g @ast-grep/cli
npm install -g @github/copilot
npm install -g @angular/cli

# Integations
# build integrations
~/.dotfiles/catppuccin-bat/build.sh
~/.dotfiles/catppuccin-delta/build.sh
~/.dotfiles/catppuccin-btop/build.sh
~/.dotfiles/catppuccin-zsh-syntax-highlighting/build.sh

# symlink integrations
for path in "$HOME"/.dotfiles/*/; do stow --adopt -t "$HOME" -d "$HOME"/.dotfiles/ "$(basename "$path")"; done

# install integrations
~/.dotfiles/catppuccin-bat/install.sh
~/.dotfiles/catppuccin-delta/install.sh
~/.dotfiles/tmux/install.sh
~/.dotfiles/nvim/install.sh

# User
# change shell to zsh
sudo chsh -s /usr/bin/zsh "$USER"

# replace shell with new one
exec zsh --login
