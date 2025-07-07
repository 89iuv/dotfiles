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

```sh
# ubuntu
sudo apt install build-essentials
```

```sh
# macos
xcode-select --install
```

## Environment

- Install nerd fonts: [NerdFonts Download](https://www.nerdfonts.com/font-downloads)
- Configure terminal colors: [Catppuccin Terminal Ports](https://catppuccin.com/ports/?q=terminal)
- Install nix package manager: [Nix Package Manager Download](https://nixos.org/download)

## Setup

```sh
# clone repo
git clone --recurse-submodules https://github.com/89iuv/dotfiles.git .dotfiles
```

```sh
# link dotfiles
cd ~/.dotfiles
nix-shell -p stow --run "stow */"
```

```sh
# install packages
nix-shell -p home-manager --run "home-manager switch --impure"
```

```sh
# run integration scripts
cd ~/.dotfiles/catppuccin-bat && ./install.sh
cd ~/.dotfiles/catppuccin-delta && ./install.sh
cd ~/.dotfiles/catppuccin-btop && ./install.sh
```

```sh
# change shell to zsh
which zsh > tmp.txt
sudo sh -c "cat tmp.txt >> /etc/shells"
chsh -s $(which zsh)
rm tmp.txt
```

```sh
# install github copilot cli
gh auth login
gh extension install github/gh-copilot
```

## Update

Update Ubuntu:

```sh
sudo apt update
sudo apt upgrade
```

Update dotfiles:

```sh
cd ~/.dotfiles
git pull
git submodule update --recursive --init
```

Update home-manager:

```sh
cd ~/.config/home-manager
nix flake update
home-manager switch --impure
```

Update others:

- Update Tmux: Ctrl+x U all
- Update Neovim: \<leader\>l U
- Update Mason: \<leader\>cm U

## Issues

The following issues are found in:

- MacBook Pro M1 → Parallels → Windows11 → Wsl1 → Ubuntu24.04:
  - marksman throws error: AdvSimd processor support required
