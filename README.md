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

## Setup

### Setup Dotfiles

```sh
# clean up
rm -rf ~/.zprofile ~/.zshrc

# clone repo
git clone --recurse-submodules https://github.com/89iuv/dotfiles.git .dotfiles
cd ~/.dotfiles

# build integrations
~/.dotfiles/catppuccin-bat/build.sh
~/.dotfiles/catppuccin-delta/build.sh
~/.dotfiles/catppuccin-btop/build.sh
~/.dotfiles/catppuccin-zsh-syntax-highlighting/build.sh

# symlink integrations
stow */

# run integration scripts
~/.dotfiles/catppuccin-bat/install.sh
~/.dotfiles/catppuccin-delta/install.sh
~/.dotfiles/tmux/install.sh
~/.dotfiles/nvim/install.sh
~/.dotfiles/docker/install.sh
```

### Setup Shell

```sh
sudo chsh -s /usr/bin/zsh "$USER"
exec zsh --login
```

## Docker

### Run With Docker

```sh
docker run --rm -it \
-e USER_UID=$(id -u) \
-e USER_GID=$(id -g) \
-e DOCKER_GID=$(getent group docker | cut -d: -f3) \
-v dev_container:/home/dev \
-v /var/run/docker.sock:/var/run/docker.sock \
-v $(pwd):/workspace \
-h container \
--name dev_container \
--detach-keys="ctrl-z,z" \
89iuv/dotfiles
```

Where:

- --rm: will remove the container upon exit
- -it: run the container with an interactive terminal
- -e USER_UID=$(id -u): set the env var DEV_UID to the host user uid, defaults
  to 1000
- -e USER_GID=$(id -g): set the env var DEV_GID to the host user gid, defaults
  to 1000
- -e DOCKER_GID=$(getent group docker | cut -d: -f3): set the env var DOCKER_GID
  to the host docker gid, defaults to 1001
- -v container:/home/byte_crafter: create and mount the volume container
  as the byte_crafter home folder
- -v /var/run/docker.sock:/var/run/docker.sock: enable docker access from the
  container
- -v ./:/workspace: mount the current folder to /workspace folder in the
  container
- -h container: set the hostname to container
- --name dev_container: set the container name to container
- --detach-keys="ctrl-z,z": remap the docker detach keymap from Ctrl+p,Ctrl+q to
  Ctrl+z,z
- 89iuv/dotfiles: download and use the image 89iuv/dotfile

Notes:

- the container's user uid and gid need to match the host's user uid and gid in
  order to not have permissions issues when writing files
- the container's docker gid needs to match the host's docker gid to use docker
  without sudo

Caveats:

- startup is slow the first time until all the needed files are created on
  volume /home/dev

### Remove From Docker

```sh
docker volume rm container
docker image rm 89iuv/dotfiles
```
