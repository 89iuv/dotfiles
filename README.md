# Dotfiles

## Setup Environment 
- Install nerd fonts: [NerdFonts Download](https://www.nerdfonts.com/font-downloads)
- Configure terminal colors: [Catppuccin Terminal Ports](https://catppuccin.com/ports/?q=terminal)
- Install nix package manager: [Nix Package Manager Download](https://nixos.org/download) 

## Setup Dotfiles
```sh
# clone repo
git clone https://github.com/89iuv/dotfiles.git .dotfiles

# move to .dotfiles directory
cd .dotfiles

# create .config folder so that it's not symlink by stow
mkdir ~/.config

# link dotfiles
nix-shell -p stow --run"stow */"

# install packages
nix-shell -p home-manager --run"home-manager switch --impure"
```
