# Dotfiles

<!--toc:start-->
- [Dotfiles](#dotfiles)
  - [Environment](#environment)
    - [Clone repo](#clone-repo)
  - [System](#system)
    - [Fedora](#fedora)
    - [Fedora Native (without Home Manager)](#fedora-native-without-home-manager)
    - [Ubuntu](#ubuntu)
    - [MacOS](#macos)
  - [Setup](#setup)
    - [Install dependencies using Home Manager](#install-dependencies-using-home-manager)
    - [Link dotfiles](#link-dotfiles)
    - [Run integration scripts](#run-integration-scripts)
    - [Optional decouple dictionaries](#optional-decouple-dictionaries)
    - [Change shell to zsh](#change-shell-to-zsh)
    - [Install Python](#install-python)
    - [Install Nodejs](#install-nodejs)
    - [Install github copilot cli](#install-github-copilot-cli)
    - [Install tiktoken for github copilot chat](#install-tiktoken-for-github-copilot-chat)
  - [Update](#update)
    - [Update Fedora](#update-fedora)
    - [Update Ubuntu](#update-ubuntu)
    - [Update MacOS](#update-macos)
    - [Update Home Manager](#update-home-manager)
    - [Update dotfiles](#update-dotfiles)
    - [Update integrations](#update-integrations)
    - [Optional update dictionaries](#optional-update-dictionaries)
    - [Update others](#update-others)
  - [Issues](#issues)
<!--toc:end-->

## Environment

- Install nerd fonts: [Nerdfonts Download](https://www.nerdfonts.com/font-downloads)
- Configure terminal colors: [Catppuccin Terminal Ports](https://catppuccin.com/ports/?q=terminal)
- Install nix package manager: [Nix Package Manager Download](https://nixos.org/download)
- Add key binding to replace `capslook` with `esc`

### Clone repo

```sh
git clone --recurse-submodules https://github.com/89iuv/dotfiles.git .dotfiles
```

## System

Install platform specific build tools ex: make, gcc, etc.

### Fedora

```sh
# git
sudo dnf group install c-development development-tools

# python
sudo dnf install make gcc patch zlib-devel bzip2 bzip2-devel \
readline-devel sqlite sqlite-devel openssl-devel tk-devel \
libffi-devel xz-devel libuuid-devel gdbm-libs libnsl2
```

### Fedora Native (without Home Manager)

By installing this dependencies you can skip installing nix pkgs

```sh
# enable rpm fusion free and non free
sudo dnf install \
https://download1.rpmfusion.org\
/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

sudo dnf install \
https://download1.rpmfusion.org\
/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# enable copr repos
sudo dnf copr enable atim/lazygit -y

# install dependencies
sudo dnf install \
git-delta \
zsh zoxide bat fzf ripgrep fd jq stow \
curl wget lynx \
lua luarocks compat-lua \
neovim tmux btop lazygit \
fastfetch

# manual instalation
wget -c https://github.com\
/eza-community/eza/releases/latest/download\
/eza_x86_64-unknown-linux-gnu.tar.gz -O - | tar xz

sudo chmod +x eza
sudo chown root:root eza
sudo mv eza /usr/local/bin/eza
```

Issues:

- wordnet from the fedora package does not work

### Ubuntu

```sh
# system
sudo apt install build-essentials inotify-tools

# python
sudo apt install make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl git \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
```

### MacOS

```sh
# system
xcode-select --install

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# python
brew install openssl readline sqlite3 xz zlib tcl-tk@8 libb2
```

## Setup

### Install dependencies using Home Manager

```sh
nix-shell -p home-manager --run "home-manager switch --impure"
```

### Link dotfiles

```sh
cd ~/.dotfiles
stow --run "stow */"
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
```

### Install Nodejs

```sh
# download
curl -fsSL https://fnm.vercel.app/install \
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

### Update Fedora

```sh
sudo dnf upgrade
```

### Update Ubuntu

```sh
sudo apt update
sudo apt upgrade
```

### Update MacOS

```sh
brew update
brew upgrade
```

### Update Home Manager

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
