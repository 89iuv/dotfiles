# Dotfiles

- [Dotfiles](#dotfiles)
  - [Environment](#environment)
  - [Repo](#repo)
  - [System](#system)
  - [Tools](#tools)
  - [Coding](#coding)
  - [Containers](#containers)
  - [Wsl](#wsl)
  - [AI](#ai)
  - [Clean Up](#clean-up)

## Environment

- Install Fedora in WSL: [Fedora WSL Documentation](https://docs.fedoraproject.org/en-US/cloud/wsl/)
- Install Nvidia Container Toolkit: [Nvidia Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)
- Install Nerd Fonts: [Nerdfonts Download](https://www.nerdfonts.com/font-downloads)
- Install Jetbrains Mono Font: [Jetbrains Mono Font Download](https://www.jetbrains.com/lp/mono/)
- Install Catppuccin Theme: [Catppuccin Terminal Ports](https://catppuccin.com/ports/?q=terminal)

## Repo

```sh
# install git
sudo dnf install -y git

# clone repo
git clone --recurse-submodules https://github.com/89iuv/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

## System

```sh
# update installed packages and repositories
sudo dnf -y update

# install development tools: git, c compiler, make, etc
sudo dnf -y group install c-development development-tools

# install dependencies
sudo dnf -y install \
  wol \
  xsel \
  script zoxide fzf bat ripgrep fd jq stow \
  curl wget \
  stress hyperfine \
  chafa
```

## Tools

```sh
# ssh
sudo dnf install -y sshd
sudo systemctl enable --now sshd

# zsh
sudo dnf -y install zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
  "" --unattended

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

git clone https://github.com/zsh-users/zsh-autosuggestions \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-history-substring-search \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone https://github.com/Pilaton/OhMyZsh-full-autoupdate.git \
  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/ohmyzsh-full-autoupdate

mv ~/.zshrc ~/.zshrc.bak
stow zsh
echo exit | script -qec zsh /dev/null >/dev/null

# eza
sudo dnf install -y eza
stow eza

# git-delta
sudo dnf install -y git-delta

git config --global core.pager delta
git config --global include.path "$HOME/.dotfiles/catppuccin/delta/catppuccin.gitconfig"

git config --global delta.features catppuccin-macchiato
git config --global delta.true-colors "always"
git config --global delta.line-numbers true

git config --global delta.commit-decoration-style "bold"

git config --global delta.file-style "#b7bdf8"
git config --global delta.file-decoration-style "ul #b7bdf8"

git config --global delta.hunk-header-style omit
git config --global delta.hunk-header-decoration-style "ul #6e738d"

git config --global diff.colorMoved default
git config --global merge.conflictstyle zdiff3
git config --global interactive.diffFilter "delta --color-only"

git config --global alias.diff-unified "-c delta.hunk-header-style=auto -c delta.line-numbers=false diff"
git config --global alias.diff-compare "-c delta.hunk-header-style=omit -c delta.side-by-side=true diff"

# tmux
sudo dnf -y install tmux
stow tmux

# nvim
sudo dnf -y install tree-sitter-cli
sudo dnf -y install neovim
stow nvim

# btop
sudo dnf -y install btop
stow btop

# fastfetch
sudo dnf -y install fastfetch
stow fastfetch
```

## Coding

```sh
# java
sudo dnf install -y java-latest-openjdk-devel maven

# python
sudo dnf install -y python pip uv

# nodejs
sudo dnf install -y node

# lua
sudo dnf install -y lua luarocks compat-lua
```

## Containers

```sh
# hadolint
sudo dnf install -y hadolint

# docker
sudo dnf config-manager addrepo --overwrite --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

mkdir -p ~/.oh-my-zsh/completions/
docker completion zsh > ~/.oh-my-zsh/completions/_docker

sudo usermod -aG docker "$USER"
sudo systemctl enable --now docker.service
```

## Wsl

```sh
# setup windows user name env var
WINDOWS_USER_NAME=<your_windows_user_name>
command cat <<EOF >> ~/.zshrc_local
# windows user name
export WINDOWS_USER_NAME=$WINDOWS_USER_NAME
EOF
```

## AI

```sh
# setup zcat api key
mkdir -p "$HOME/.config/opencode"
ZCAT_LLM_KEY=<your_zcat_llm_key>
echo "$ZCAT_LLM_KEY" > "$HOME/.config/opencode/secrets.txt"

# opencode
curl -fsSL https://opencode.ai/v2/install | bash

# workaround for opencode not working well with symlinks
# https://github.com/anomalyco/opencode/pull/45071
# stow opencode
cp ~/.dotfiles/opencode/.config/opencode/cli.json ~/.config/opencode/cli.json
cp ~/.dotfiles/opencode/.config/opencode/opencode.jsonc ~/.config/opencode/opencode.jsonc
```

## Clean Up

```sh
# remove or invalidate cache data
sudo dnf clean all

# change shell to zsh (restart may be needed)
sudo chsh -s $(which zsh) $(whoami)

# replace shell with new one
exec zsh --login
```
