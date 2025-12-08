# Dotfiles

<!-- markdownlint-disable MD013 -->

<!--toc:start-->
- [Dotfiles](#dotfiles)
  - [System](#system)
    - [Environment](#environment)
    - [Install git](#install-git)
    - [Clone repo](#clone-repo)
    - [Install dependencies](#install-dependencies)
  - [Setup](#setup)
    - [Link dotfiles](#link-dotfiles)
    - [Run integration scripts](#run-integration-scripts)
    - [Change shell to zsh](#change-shell-to-zsh)
  - [Additional](#additional)
    - [Install Python](#install-python)
    - [Install Nodejs](#install-nodejs)
  - [Update](#update)
    - [Update dotfiles](#update-dotfiles)
    - [Update integrations](#update-integrations)
    - [Update others](#update-others)
<!--toc:end-->

## System

### Environment

- Install Fedora in WSL: [Fedora WSL Documentation](https://docs.fedoraproject.org/en-US/cloud/wsl/)
- Install NerdFonts: [Nerdfonts Download](https://www.nerdfonts.com/font-downloads)
- Configure terminal colors: [Catppuccin Terminal Ports](https://catppuccin.com/ports/?q=terminal)

### Install git

```sh
sudo dnf group install c-development development-tools
```

### Clone repo

```sh
git clone --recurse-submodules https://github.com/89iuv/dotfiles.git .dotfiles
```

### Install dependencies

```sh

# enable rpm fusion free
sudo dnf install \
https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

# enable rpm fusion non free
sudo dnf install \
https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# install dependencies
sudo dnf install \
git-delta \
zsh zoxide bat fzf ripgrep fd jq stow \
curl wget lynx \
chafa ImageMagick \
lua luarocks compat-lua \
tmux \
stress hyperfine \
fastfetch

# install eza
wget -c https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz -O - | tar xz
sudo chmod +x eza
sudo chown root:root eza
sudo mv eza /usr/local/bin/eza

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

# fix neovim clipboard issue
# TODO: find a better way to fix the clipboard issue on wsl
sudo dnf remove xclip wl-clipboard

# (optional) install kitty dependencies
sudo dnf install xz
```

## Setup

### Link dotfiles

```sh
cd ~/.dotfiles
stow */
```

### Run integration scripts

```sh
cd ~/.dotfiles/catppuccin-bat && ./install.sh
cd ~/.dotfiles/catppuccin-delta && ./install.sh
cd ~/.dotfiles/catppuccin-btop && ./install.sh
```

### Change shell to zsh

```sh
chsh -s /usr/bin/zsh
# restart shell
```

### Install tmux plugins

```sh
# start a new tmux session
tn
```

Install plugins:
Meta+I

## Additional

### Install Python

```sh
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
```

### Install Nodejs

```sh
# download
curl -fsSL https://fnm.vercel.app/install | bash -s -- --install-dir "$HOME/.fnm" --skip-shell --force-install

# setup
FNM_PATH="$HOME/.fnm"
export PATH="$HOME/.fnm:$PATH"
eval "$(fnm env --shell zsh)"

# install
fnm install 22

# install global packages
# neovim
npm install --global @ast-grep/cli
```

### Install Go

```sh
# download
wget https://go.dev/dl/go1.25.5.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go1.25.5.linux-amd64.tar.gz

# setup
export GO_INSTALL_PATH="/usr/local/go"
export PATH="$GO_INSTALL_PATH/bin:$PATH"

export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:$PATH"

# clean up
rm -rf go1.25.5.linux-amd64.tar.gz
```

Cleanup .zshrc script

## Update

### Update dotfiles

```sh
cd ~/.dotfiles
git pull
git submodule update --recursive --init
```

### Update integrations

```sh
cd ~/.dotfiles/catppuccin-bat && ./install.sh
cd ~/.dotfiles/catppuccin-delta && ./install.sh
cd ~/.dotfiles/catppuccin-btop && ./install.sh
```

### Update others

- Update tmux: ctrl+x U all
- Update neovim: \<leader\>l U
- Update mason: \<leader\>cm U
