# Dotfiles

<!--toc:start-->
- [Dotfiles](#dotfiles)
  - [System](#system)
    - [Fedora](#fedora)
    - [Ubuntu](#ubuntu)
    - [Macos](#macos)
  - [Environment](#environment)
  - [Setup](#setup)
    - [Clone repo](#clone-repo)
    - [Link dotfiles](#link-dotfiles)
    - [Install packages](#install-packages)
    - [Run integration scripts](#run-integration-scripts)
    - [Optional decouple dictionaries](#optional-decouple-dictionaries)
    - [Change shell to zsh](#change-shell-to-zsh)
    - [Compile terminfo for wezterm](#compile-terminfo-for-wezterm)
    - [Install Python](#install-python)
    - [Install Nodejs](#install-nodejs)
    - [Install github copilot cli](#install-github-copilot-cli)
    - [Install tiktoken for github copilot chat](#install-tiktoken-for-github-copilot-chat)
  - [Update](#update)
    - [Update Ubuntu](#update-ubuntu)
    - [Update home-manager](#update-home-manager)
    - [Update dotfiles](#update-dotfiles)
    - [Update integrations](#update-integrations)
    - [Optional update dictionaries](#optional-update-dictionaries)
    - [Update others](#update-others)
  - [Issues](#issues)
<!--toc:end-->

## System

Install platform specific build tools ex: make, gcc, etc.

### Fedora

```sh
# git
dnf install git-core

# python
dnf install make gcc patch zlib-devel bzip2 bzip2-devel\
readline-devel sqlite sqlite-devel openssl-devel tk-devel\
libffi-devel xz-devel libuuid-devel gdbm-libs libnsl2
```

### Ubuntu

```sh
# system
sudo apt install build-essentials inotify-tools

# python
sudo apt install make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl git \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
```

### Macos

```sh
# system
xcode-select --install

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# python
brew install openssl readline sqlite3 xz zlib tcl-tk@8 libb2
```

## Environment

- Install wezterm: [Wezterm](https://wezterm.org/installation.html)
- Install nerd fonts: [Nerdfonts Download](https://www.nerdfonts.com/font-downloads)
- Configure terminal colors: [Catppuccin Terminal Ports](https://catppuccin.com/ports/?q=terminal)
- Install nix package manager: [Nix Package Manager Download](https://nixos.org/download)

## Setup

### Clone repo

```sh
git clone --recurse-submodules https://github.com/89iuv/dotfiles.git .dotfiles
```

### Link dotfiles

```sh
cd ~/.dotfiles
nix-shell -p stow --run "stow */"
```

### Install packages

```sh
nix-shell -p home-manager --run "home-manager switch --impure"
```

### Run integration scripts

```sh
cd ~/.dotfiles/catppuccin-bat && ./install.sh
cd ~/.dotfiles/catppuccin-delta && ./install.sh
cd ~/.dotfiles/catppuccin-btop && ./install.sh
```

### Optional decouple dictionaries

```sh
rm -rf ~/.config/harper
cp -r ~/.dotfiles/harper/.config/harper ~/.config/harper
```

### Change shell to zsh

```sh
which zsh > tmp.txt
sudo sh -c "cat tmp.txt >> /etc/shells"
chsh -s $(which zsh)
rm tmp.txt
zsh
```

### Compile terminfo for wezterm

```sh
tempfile=$(mktemp) \
  && curl -o $tempfile https://raw.githubusercontent.com/wezterm/wezterm/master/termwiz/data/wezterm.terminfo \
  && tic -x -o ~/.terminfo $tempfile \
  && rm $tempfile
```

### Install Python

```sh
# download
curl -fsSL https://pyenv.run | bash

# setup
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# install
pyenv install 3
pyenv global 3
```

### Install Nodejs

```sh
# download
curl -fsSL https://fnm.vercel.app/install\
  | bash -s -- --install-dir "$HOME/.fnm" --skip-shell --force-install

# setup
FNM_PATH="$HOME/.fnm"
export PATH="$HOME/.fnm:$PATH"
eval "$(fnm env --shell zsh)"

# install
fnm install 22
```

### Install github copilot cli

```sh
gh auth login
gh extension install github/gh-copilot
```

### Install tiktoken for github copilot chat

```sh
luarocks install --lua-version 5.1 tiktoken_core --local
```

## Update

### Update Ubuntu

```sh
sudo apt update
sudo apt upgrade
```

### Update home-manager

```sh
cd ~/.config/home-manager
nix flake update
home-manager switch --impure
```

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

### Optional update dictionaries

```sh
sort -U \
~/.dotfiles/harper/.config/harper/words.txt \
~/.config/harper/words.txt \
> ~/.config/harper/words.txt
```

### Update others

- Update tmux: ctrl+x U all
- Update neovim: \<leader\>l U
- Update mason: \<leader\>cm U

## Issues

The following issues are found in:

- MacBook Pro M1 → Parallels → Windows11 → Wsl1 → Ubuntu24.04:
  - marksman throws error: AdvSimd processor support required
