# Dotfiles

<!--toc:start-->
- [Dotfiles](#dotfiles)
  - [Environment](#environment)
  - [Setup](#setup)
  - [Issues](#issues)
<!--toc:end-->

## Environment

- Install nerd fonts: [NerdFonts Download](https://www.nerdfonts.com/font-downloads)
- Configure terminal colors: [Catppuccin Terminal Ports](https://catppuccin.com/ports/?q=terminal)
- Install nix package manager: [Nix Package Manager Download](https://nixos.org/download)
- Install platform specific build tools ex: make, gcc, etc.

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
# run local scripts
cd ~/.dotfiles/catppuccin-bat && ./install.sh
cd ~/.dotfiles/catppuccin-delta && ./install.sh
```

```sh
# change shell to zsh
which zsh > tmp.txt
sudo sh -c "cat tmp.txt >> /etc/shells"
chsh -s $(which zsh)
rm tmp.txt
```

## Issues

The following issues are found in
Macbook Pro M1 -> Parallels -> Windows11 -> Wsl1 -> Ubuntu24.04:

- marksman trows error: AdvSimd processor support required
