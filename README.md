# Dotfiles

## Setup Environment

- Install nerd fonts: [NerdFonts Download](https://www.nerdfonts.com/font-downloads)
- Configure terminal colors: [Catppuccin Terminal Ports](https://catppuccin.com/ports/?q=terminal)
- Install nix package manager: [Nix Package Manager Download](https://nixos.org/download)

## Setup Dotfiles

```sh
# clone repo
git clone --recurse-submodules https://github.com/89iuv/dotfiles.git .dotfiles

# link dotfiles
cd ~/.dotfiles
nix-shell -p stow --run "stow */"

# install packages
nix-shell -p home-manager --run "home-manager switch --impure"

# run local scripts
cd ~/.dotfiles/catppuccin-bat && ./install.sh
cd ~/.dotfiles/catppuccin-delta && ./install.sh

# change shell to zsh
which zsh > tmp.txt
sudo sh -c "cat tmp.txt >> /etc/shells"
chsh -s $(which zsh)
rm tmp.txt
```
