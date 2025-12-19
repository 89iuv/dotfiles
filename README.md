# Dotfiles

<!-- markdownlint-disable MD013 -->

<!--toc:start-->
- [Dotfiles](#dotfiles)
  - [System](#system)
    - [Setup Environment](#setup-environment)
    - [Install Dependencies](#install-dependencies)
  - [Tools](#tools)
    - [Install eza](#install-eza)
  - [Programming](#programming)
    - [Install Python](#install-python)
    - [Install Nodejs](#install-nodejs)
    - [Install Go](#install-go)
  - [Setup](#setup)
    - [Setup Dotfiles](#setup-dotfiles)
    - [Setup Shell](#setup-shell)
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

- Install Fedora in WSL:
  [Fedora WSL Documentation](https://docs.fedoraproject.org/en-US/cloud/wsl/)
- Install NerdFonts:
  [Nerdfonts Download](https://www.nerdfonts.com/font-downloads)
- Configure terminal colors:
  [Catppuccin Terminal Ports](https://catppuccin.com/ports/?q=terminal)

### Install Dependencies

```sh
# update installed packages and repositories
sudo dnf update

# install development tools: git, c compiler, make, etc
sudo dnf group install c-development development-tools

# enable rpm fusion free
sudo dnf install \
https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf install \
https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# install dependencies
sudo dnf install ps \
git-delta \
zsh zoxide bat fzf ripgrep fd jq stow \
curl wget lynx \
chafa ImageMagick \
lua luarocks compat-lua \
tmux neovim btop \
stress hyperfine \
fastfetch

# install lazygit
sudo dnf copr enable atim/lazygit -y
sudo dnf install lazygit

# install python: pyenv packages
sudo dnf install make gcc patch zlib-devel bzip2 bzip2-devel \
readline-devel sqlite sqlite-devel openssl-devel tk-devel \
libffi-devel xz-devel libuuid-devel gdbm-libs libnsl2

# install docker cli
sudo dnf config-manager addrepo --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# optional install docker engine: sudo dnf install docker-ce

# clean up
sudo dnf clean all
```

## Tools

### Install eza

```sh
# install eza
curl -fsSL https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz \
| tar xz
chmod +x eza
chown root:root eza
mv eza /usr/local/bin/eza
```

## Programming

### Install Python

```sh
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

# add shell completions
mkdir -p ~/.oh-my-zsh/completions/ && \
fnm completions --shell zsh  > ~/.oh-my-zsh/completions/_fnm && \

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

Manual cleanup for .zshrc script

## Setup

### Setup Dotfiles

```sh
# clone repo
git clone --recurse-submodules https://github.com/89iuv/dotfiles.git .dotfiles

# clean up
rm -rf ~/.zprofile ~/.zshrc

# symlink .dotfiles
cd ~/.dotfiles
stow */

# run integration scripts
~/.dotfiles/catppuccin-bat/install.sh
~/.dotfiles/catppuccin-delta/install.sh
~/.dotfiles/catppuccin-btop/install.sh
~/.dotfiles/nvim/install.sh
~/.dotfiles/tmux/install.sh
~/.dotfiles/docker/install.sh
```

### Setup Shell

```sh
chsh -s /usr/bin/zsh
```

Restart shell

## Update

### Update Dotfiles

```sh
cd ~/.dotfiles
git pull
git submodule update --recursive --init
```

### Update Integrations

```sh
~/.dotfiles/catppuccin-bat/install.sh
~/.dotfiles/catppuccin-delta/install.sh
~/.dotfiles/catppuccin-btop/install.sh
~/.dotfiles/nvim/install.sh
~/.dotfiles/tmux/install.sh
~/.dotfiles/docker/install.sh
```

### Update Others

- Update tmux: ctrl+x U all
- Update neovim: \<leader\>l U
- Update mason: \<leader\>cm U

## Docker

### Run With Docker

```sh
docker run --rm -it \
-e DEV_UID=$(id -u) \
-e DEV_GID=$(id -g) \
-e DOCKER_GID=$(getent group docker | cut -d: -f3) \
-v dotfiles:/home/dev \
-v ./:/home/dev/workspace \
-v /var/run/docker.sock:/var/run/docker.sock \
--detach-keys="ctrl-z,z" \
89iuv/dotfiles
```

Caveats:

- startup is slow the first time until all the needed files are created on
  volume /home/dev

### Remove From Docker

```sh
docker volume rm dotfiles
docker image rm 89iuv/dotfiles
```
