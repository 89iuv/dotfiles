# Dotfiles

- [Dotfiles](#dotfiles)
  - [Environment](#environment)
  - [Repo](#repo)
  - [System](#system)
  - [Tools](#tools)
  - [Coding](#coding)
  - [AI](#ai)
  - [Containers](#containers)
  - [Clean Up](#clean-up)

## Environment

- Install Fedora in WSL: [Fedora WSL Documentation](https://docs.fedoraproject.org/en-US/cloud/wsl/)
- Install Nvidia Container Toolkit: [Nvidia Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)
- Install Nerd Fonts: [Nerdfonts Download](https://www.nerdfonts.com/font-downloads)

## Repo

```sh
# install git
sudo dnf install -y git

# global config
git config --global pull.rebase false
git config --global diff.colorMoved default
git config --global merge.conflictstyle zdiff3

# clone repo
git clone https://github.com/89iuv/dotfiles.git ~/.dotfiles
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
  xsel \
  script zoxide fzf bat glow ripgrep fd jq stow \
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

stow zsh
echo exit | script -qec zsh /dev/null >/dev/null

# eza
mkdir tmp
cd tmp

curl -fsSL https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz \
  | tar xz

chmod +x eza
sudo chown root:root eza
sudo mv eza /usr/local/bin/eza
cd ..
rm -rf tmp

# tmux
sudo dnf -y install tmux
stow tmux

# nvim
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

## AI

```sh
# NOTE: replace <your_api_key> with the mcp api key
ZCAT_LLM_KEY=<your_api_key>
CONTEXT7_API_KEY=<your_api_key>

# setup zcat api key
command cat <<EOF >> ~/.zshrc_local
# context7
export ZCAT_LLM_KEY=$ZCAT_LLM_KEY
EOF

# setup context7 api key
command cat <<EOF >> ~/.zshrc_local
# context7
export CONTEXT7_API_KEY=$CONTEXT7_API_KEY
EOF

# opencode
curl -fsSL https://opencode.ai/install | bash
stow opencode
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

## Clean Up

```sh
# remove or invalidate cache data
sudo dnf clean all

# change shell to zsh
sudo chsh -s $(which zsh) $(whoami)

# replace shell with new one
exec zsh --login
```
