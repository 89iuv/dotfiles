# Dotfiles

## Instal nix package manager
[Nix Package Manager Download](https://nixos.org/download)

## Install dotfiles
```sh
# clone repo
git clone https://github.com/89iuv/dotfiles.git .dotfiles

# move to .dotfiles directory
cd .dotfiles

# create .config folder so that it's not symlink by stow
mkdir ~/.config

# link dotfiles
nix-shell -p stow --run"stow ."

# install packages
nix-shell -p home-manager --run"home-manager switch --impure"
```
