# Dotfiles

<!--toc:start-->
- [Dotfiles](#dotfiles)
  - [System](#system)
  - [Environment](#environment)
  - [Setup](#setup)
  - [Update](#update)
  - [Issues](#issues)
<!--toc:end-->

## System

Install platform specific build tools ex: make, gcc, etc.

### ubuntu

```sh
# system
sudo apt install build-essentials inotify-tools

# python
sudo apt install make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl git \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
```

### macos

```sh
# system
xcode-select --install

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# python
brew install openssl readline sqlite3 xz zlib tcl-tk@8 libb2
```

## Environment

- Install nerd fonts: [Nerdfonts Download](https://www.nerdfonts.com/font-downloads)
- Configure terminal colors: [Catppuccin Terminal Ports](https://catppuccin.com/ports/?q=terminal)
- Install nix package manager: [Nix Package Manager Download](https://nixos.org/download)

## Setup

Clone repo:

```sh
git clone --recurse-submodules https://github.com/89iuv/dotfiles.git .dotfiles
```

Link dotfiles:

```sh
cd ~/.dotfiles
nix-shell -p stow --run "stow */"
```

Install packages:

```sh
nix-shell -p home-manager --run "home-manager switch --impure"
```

Run integration scripts:

```sh
cd ~/.dotfiles/catppuccin-bat && ./install.sh
cd ~/.dotfiles/catppuccin-delta && ./install.sh
cd ~/.dotfiles/catppuccin-btop && ./install.sh
```

Optional decouple dictionaries:

```sh
rm -rf ~/.config/harper
cp -r ~/.dotfiles/harper/.config/harper ~/.config/harper
```

Programming languages

python:

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

nodejs

```sh
# download
curl -fsSL https://fnm.vercel.app/install | bash -s -- --install-dir "~/.fnm" --skip-shell --force-install

# setup
FNM_PATH="~/.fnm"
export PATH="~/.fnm:$PATH"
eval "$(fnm env --shell zsh)"

# install
fnm install 22
```

Change shell to zsh:

```sh
which zsh > tmp.txt
sudo sh -c "cat tmp.txt >> /etc/shells"
chsh -s $(which zsh)
rm tmp.txt
```

Install github copilot cli:

```sh
gh auth login
gh extension install github/gh-copilot
```

Install tiktoken for github copilot chat

```sh
luarocks install --lua-version 5.1 tiktoken_core --local
```

## Update

Update Ubuntu:

```sh
sudo apt update
sudo apt upgrade
```

Update home-manager:

```sh
cd ~/.config/home-manager
nix flake update
home-manager switch --impure
```

Update dotfiles:

```sh
cd ~/.dotfiles
git pull
git submodule update --recursive --init
```

Update integrations:

```sh
cd ~/.dotfiles/catppuccin-bat && ./install.sh
cd ~/.dotfiles/catppuccin-delta && ./install.sh
cd ~/.dotfiles/catppuccin-btop && ./install.sh
```

Optional update dictionaries:

```sh
sort -U \
~/.dotfiles/harper/.config/harper/words.txt \
~/.config/harper/words.txt \
> ~/.config/harper/words.txt
```

Update others:

- Update tmux: ctrl+x U all
- Update neovim: \<leader\>l U
- Update mason: \<leader\>cm U

## Issues

The following issues are found in:

- MacBook Pro M1 → Parallels → Windows11 → Wsl1 → Ubuntu24.04:
  - marksman throws error: AdvSimd processor support required
