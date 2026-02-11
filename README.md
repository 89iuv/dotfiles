# Dotfiles

- [Dotfiles](#dotfiles)
  - [Environment](#environment)
  - [Repo](#repo)
  - [System](#system)
  - [Tools](#tools)
  - [Coding](#coding)
  - [Containers](#containers)
  - [Local AI](#local-ai)
  - [Clean up](#clean-up)

## Environment

- Install Fedora in WSL: [Fedora WSL Documentation](https://docs.fedoraproject.org/en-US/cloud/wsl/)
- Install Nvidia Container Toolkit in Fedora: [Nvidia Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)
- Disable Windows Path in WSL: [Stack Overflow](https://stackoverflow.com/questions/51336147/how-to-remove-the-win10s-path-from-wsl/51345880#51345880)
- Install NerdFonts: [Nerdfonts Download](https://www.nerdfonts.com/font-downloads)
- Configure terminal colors: [Catppuccin Terminal Ports](https://catppuccin.com/ports/?q=terminal)

## Repo

```sh
# isntall git
sudo dnf install -y git

# clone repo and run install script
git clone --recurse-submodules https://github.com/89iuv/dotfiles.git ~/.dotfiles
```

## System

```sh
# update installed packages and repositories
sudo dnf -y update

# install development tools: git, c compiler, make, etc
sudo dnf -y group install c-development development-tools

# install dependencies
sudo dnf -y install \
  xclip xsel \
  script zoxide fzf bat ripgrep fd jq stow \
  curl wget lynx \
  chafa ImageMagick \
  btop glow \
  stress hyperfine \
  fastfetch
```

## Tools

```sh
# ssh
sudo dnf install -y sshd
sudo systemctl enable --now sshd
# TODO: harden ssh connection

# zsh
sudo dnf -y install zsh
echo exit | script -qec zsh /dev/null >/dev/null
stow ohmyzsh zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting powerlevel10k zsh

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

# lazygit
sudo dnf copr enable -y dejan/lazygit
sudo dnf install -y lazygit
stow lazygit

# tmux
sudo dnf -y install tmux
stow tmux

# neovim
sudo dnf -y install neovim
stow nvim
```

## Coding

```sh
# install java
sudo dnf install -y java-latest-openjdk-devel maven

# install python
sudo dnf install -y python pip uv

# install nodejs
sudo dnf install -y node

# install nodejs: npm: global pckages
npm install -g @ast-grep/cli
npm install -g @github/copilot

# install lua
sudo dnf install -y lua luarocks compat-lua
```

## Containers

```sh
# install docker
sudo dnf config-manager addrepo --overwrite --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
mkdir -p ~/.oh-my-zsh/completions/
docker completion zsh > ~/.oh-my-zsh/completions/_docker
sudo usermod -aG docker "$USER"
sudo systemctl enable --now docker.service
```

## Local AI

```sh
# install ollama
curl -fsSL https://ollama.com/install.sh | sh
ollama create -f ~/.dotfiles/ollama/modelfile_gpt-oss-20b-ol gpt-oss:20b
sudo cp ollama/override.conf /etc/systemd/system/ollama.service.d/
sudo systemctl daemon-reload
sudo systemctl restart ollama.service

# install opencode
curl -fsSL https://opencode.ai/install | bash
~/.opencode/bin/opencode models --refresh

# install nginx
sudo dnf install -y nginx openssl
sudo systemctl enable --now nginx.service

# we can create and initialize on same line without any issues
# shellcheck disable=SC2155
export OLLAMA_API_KEY=$(openssl rand -hex 32)

# we need to pass the environment variable as is to the script
# shellcheck disable=SC2016
envsubst '${OLLAMA_API_KEY}' < ~/.dotfiles/nginx/conf.d/reverse_proxy_template.conf > reverse_proxy.conf

sudo cp reverse_proxy.conf /etc/nginx/conf.d/reverse_proxy.conf
rm -rf reverse_proxy.conf
sudo systemctl restart nginx.service
echo "$OLLAMA_API_KEY"
```

## Clean up

```sh
# remove or invalidate cache data
sudo dnf clean all

# change shell to zsh
sudo chsh -s $(which zsh) "$USER"

# replace shell with new one
exec zsh --login
```
