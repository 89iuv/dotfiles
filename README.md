# Dotfiles

<!-- markdownlint-disable MD013 -->

<!--toc:start-->
- [Dotfiles](#dotfiles)
  - [System](#system)
    - [Setup Environment](#setup-environment)
    - [Install Dependencies](#install-dependencies)
  - [Setup](#setup)
    - [Setup Dotfiles](#setup-dotfiles)
    - [Setup Shell](#setup-shell)
  - [Optional](#optional)
    - [Install Python](#install-python)
    - [Install Nodejs](#install-nodejs)
    - [Install Go](#install-go)
    - [Setup Docker](#setup-docker)
  - [Update](#update)
    - [Update Dotfiles](#update-dotfiles)
    - [Update Integrations](#update-integrations)
    - [Update Others](#update-others)
  - [Docker](#docker)
    - [Run With Docker](#run-with-docker)
    - [Remove From Docker](#remove-from-docker)
<!--toc:end-->

## System

### Setup Environment

- Install Fedora in WSL: [Fedora WSL Documentation](https://docs.fedoraproject.org/en-US/cloud/wsl/)
- Install NerdFonts: [Nerdfonts Download](https://www.nerdfonts.com/font-downloads)
- Configure terminal colors: [Catppuccin Terminal Ports](https://catppuccin.com/ports/?q=terminal)

### Install Dependencies

```sh
# install development tools: git, c compiler, make, etc
sudo dnf group install c-development development-tools

# enable rpm fusion free
sudo dnf install \
https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

# enable rpm fusion non free
sudo dnf install \
https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# install dependencies
sudo dnf install ps \
git-delta \
zsh zoxide bat fzf ripgrep fd jq stow \
curl wget lynx \
chafa ImageMagick \
lua luarocks compat-lua \
stress hyperfine \
fastfetch

# install eza
curl -fsSL https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz \
| tar xz
chmod +x eza
chown root:root eza
mv eza /usr/local/bin/eza

# install lazygit
sudo dnf copr enable atim/lazygit -y
sudo dnf install lazygit

# install btop
sudo dnf install btop
# (Optional) btop dependencies for intel gpu
sudo dnf install intel_gpu_top
# (Optional) run at every startup
# source: https://github.com/luisbocanegra/plasma-intel-gpu-monitor?tab=readme-ov-file#requirements
# TODO: add systemd script to do this automatic
sudo setcap cap_perfmon=+ep /usr/bin/btop

# install neovim
sudo dnf install neovim
# workaround for neovim clipboard issue
# TODO: find a better way to fix the clipboard issue on wsl
sudo dnf remove xclip wl-clipboard

# install tmux
sudo dnf install tmux

# install kitty
# (optional) install kitty dependencies
sudo dnf install xz

# clean up
sudo dnf clean all
```

## Setup

### Setup Dotfiles

```sh
# clone repo
git clone --recurse-submodules https://github.com/89iuv/dotfiles.git .dotfiles

# symlink .dotfiles
cd ~/.dotfiles
stow */

# run integration scripts
~/.dotfiles/catppuccin-bat/install.sh
~/.dotfiles/catppuccin-delta/install.sh
~/.dotfiles/catppuccin-btop/install.sh
~/.dotfiles/nvim/install.sh
~/.dotfiles/tmux/install.sh
```

### Setup Shell

```sh
chsh -s /usr/bin/zsh
# restart shell
```

## Optional

### Install Python

```sh
# update
sudo dnf update

# dependencies
sudo dnf install make gcc patch zlib-devel bzip2 bzip2-devel \
readline-devel sqlite sqlite-devel openssl-devel tk-devel \
libffi-devel xz-devel libuuid-devel gdbm-libs libnsl2

# download
curl -fsSL https://pyenv.run | bash

# setup
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# install
pyenv install 3
pyenv global 3

# install tools
# python project manager: uv
curl -LsSf https://astral.sh/uv/install.sh | sh
```

### Install Nodejs

```sh
# download
curl -fsSL https://fnm.vercel.app/install \
| bash -s -- --install-dir "$HOME/.fnm" --skip-shell --force-install

# setup
export FNM_PATH="$HOME/.fnm"
export PATH="$FNM_PATH:$PATH"
alias rehash='hash -r'
eval "$(fnm env --shell zsh)"
fnm completions --shell zsh  > ~/.oh-my-zsh/completions/_fnm

# install
fnm install 22

# install global packages
# neovim dependencies: ast-grep
npm install --global @ast-grep/cli

# github copilot cli
npm install -g @github/copilot
```

### Install Go

```sh
# download
mkdir -p "$HOME"/.local/
curl -fsSL https://go.dev/dl/go1.25.5.linux-amd64.tar.gz \
| tar -C "$HOME"/.local/ -xz && \
tar -C "$HOME"/.local/ -xzf go1.25.5.linux-amd64.tar.gz

# setup
export GO_INSTALL_PATH="$HOME"/.local/go
export PATH="$GO_INSTALL_PATH/bin:$PATH"

export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

# clean up
rm -rf go1.25.5.linux-amd64.tar.gz
```

### Install Docker

```sh
# create a docker user group with the id of 990
# NOTE: it is important that the GUID from the host
# matches the one from the container
# if you want to be able to access docker
# from within the container without sudo
sudo groupadd -g 1001 docker

# enable docker repo
sudo dnf config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo

# install docker cli
sudo dnf install docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

#install docker engine
sudo dnf install docker-ce

# install docker completions (docker needs to be installed)
docker completion zsh > ~/.oh-my-zsh/completions/_docker
```

Cleanup .zshrc script

## Update

### Update Dotfiles

```sh
cd ~/.dotfiles
git pull
git submodule update --recursive --init
```

### Update Integrations

```sh
cd ~/.dotfiles/catppuccin-bat && ./install.sh
cd ~/.dotfiles/catppuccin-delta && ./install.sh
cd ~/.dotfiles/catppuccin-btop && ./install.sh
cd ~/.dotfiles/nvim && ./install.sh
cd ~/.dotfiles/tmux && ./install.sh
```

### Update Others

- Update tmux: ctrl+x U all
- Update neovim: \<leader\>l U
- Update mason: \<leader\>cm U

## Docker

### Run With Docker

```sh
docker run --rm -it \
-v ./:/mnt/host \
-v dotfiles:/home/dev \
-v /var/run/docker.sock:/var/run/docker.sock \
89iuv/dotfiles:latest
```

### Remove From Docker

```sh
docker image rm 89iuv/dotfiles:latest
docker volume rm dotfiles
```
