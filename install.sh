#!/bin/bash
set -eo pipefail

# --- System ---
# update installed packages and repositories
sudo dnf -y update

# install development tools: git, c compiler, make, etc
sudo dnf -y group install c-development development-tools

# enable rpm fusion free and nonfree
sudo dnf -y install \
https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-"$(rpm -E %fedora)".noarch.rpm
sudo dnf -y install \
https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-"$(rpm -E %fedora)".noarch.rpm

## basic drivers and Vulkan support
sudo dnf install -y mesa-dri-drivers mesa-vulkan-drivers vulkan-loader mesa-libGLU

# replace the neutered ffmpeg with the real one
sudo dnf swap -y ffmpeg-free ffmpeg --allowerasing

# install all the GStreamer plugins
sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} \
  gstreamer1-plugin-openh264 gstreamer1-libav lame\* \
  --exclude=gstreamer1-plugins-bad-free-devel

# install multimedia groups
sudo dnf group install -y multimedia
sudo dnf group install -y sound-and-video

# install VA-API stuff
sudo dnf install -y ffmpeg-libs libva libva-utils

# install dependencies
sudo dnf -y install \
xclip xsel \
script zoxide fzf ripgrep fd jq stow \
curl wget lynx \
chafa ImageMagick \
lua luarocks compat-lua \
btop glow \
stress hyperfine \
fastfetch

# link dotfiles config files
for path in "$HOME"/.dotfiles/*/; do stow --adopt -t "$HOME" -d "$HOME"/.dotfiles/ "$(basename "$path")"; done

# --- Tools ---
# ssh
sudo dnf install -y sshd
sudo systemctl enable --now sshd

#  zsh
sudo dnf -y install zsh
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

# lazygit
sudo dnf copr enable -y dejan/lazygit
sudo dnf install -y lazygit

# bat
sudo dnf -y install bat
bat cache --build

# delta
sudo dnf -y install git-delta
git config --global core.pager delta
git config --global include.path "$HOME/.config/delta/themes/catppuccin.gitconfig"
git config --global interactive.diffFilter "delta --color-only"
git config --global delta.features catppuccin-macchiato
git config --global delta.true-colors "always"
git config --global delta.navigate true
git config --global delta.line-numbers true
git config --global delta.commit-decoration-style "bold"
git config --global delta.file-decoration-style "ul #6e738d"
git config --global delta.hunk-header-style omit
git config --global delta.hunk-header-decoration-style "box"
git config --global alias.diff-unified "-c delta.hunk-header-style=auto -c delta.line-numbers=false diff"
git config --global alias.diff-compare "-c delta.side-by-side=true diff"
git config --global diff.colorMoved default
git config --global merge.conflictstyle zdiff3

# tmux
sudo dnf -y install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/tpm
~/.tmux/plugins/tpm/bin/install_plugins

# neovim
sudo dnf -y install neovim

# HACK: wait for TreeSitter to finish installing
nvim --headless \
  "+Lazy! sync" \
  "+lua require('blink.cmp').setup({})" \
  "+sleep 20" \
  "+MasonToolsInstallSync" \
  +qa

# HACK: fix for lazy pulling the latest plugin versions at startup
# instead of the ones in the lock file
git checkout HEAD -- nvim/.config/nvim/lazy-lock.json
nvim --headless "+Lazy! restore" +qa

# --- Programming ---
# install java
sudo dnf install -y java-latest-openjdk-devel maven

# install python
sudo dnf install -y python pip uv

# install python: pyenv dependencies
sudo dnf install -y make gcc patch zlib-devel bzip2 bzip2-devel \
  readline-devel sqlite sqlite-devel openssl-devel tk8-devel \
  libffi-devel xz-devel libuuid-devel gdbm-libs libnsl2 libzstd-devel

# install python: pyenv
rm -rf "$HOME"/.pyenv
curl -fsSL https://pyenv.run | bash
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init - bash)"
pyenv install 3
pyenv global 3

# install nodejs
sudo dnf install -y node

# install nodejs: fnm
rm -rf "$HOME"/.fnm
curl -fsSL https://fnm.vercel.app/install | bash -s -- --install-dir "$HOME/.fnm" --skip-shell
export PATH="$HOME/.fnm:$PATH"
eval "$(fnm env --use-on-cd --shell bash)"
mkdir -p ~/.oh-my-zsh/completions/
fnm completions --shell zsh > ~/.oh-my-zsh/completions/_fnm
fnm install 24

# install nodejs: npm: global pckages
npm install -g @ast-grep/cli
npm install -g @github/copilot
npm install -g @angular/cli

# --- Containers ---
# install docker
sudo dnf config-manager addrepo --overwrite --from-repofile https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
mkdir -p ~/.oh-my-zsh/completions/
docker completion zsh > ~/.oh-my-zsh/completions/_docker
sudo usermod -aG docker "$USER"
sudo systemctl enable --now docker.service

# --- Local AI ---
# install ollama
curl -fsSL https://ollama.com/download/ollama-linux-amd64.tar.zst \
    | sudo tar x --zstd -C /usr
sudo useradd -r -s /bin/false -U -m -d /usr/share/ollama ollama
sudo usermod -a -G ollama "$(whoami)"

if systemctl is-system-running; then
  echo "systemd running"
  sudo cp ~/.dotfiles/ollama/ollama.service /etc/systemd/system/
  sudo systemctl daemon-reload
  sudo systemctl enable --now ollama.service

else
  echo "systemd not running"
  # HACK: wait for ollama server to start
  # on docker build, ollama server needs to be started manually
  export PATH="$PATH:/usr/sbin/ollama"
  nohup ollama serve > /dev/null 2>&1 & sleep 5

fi

ollama create -f ~/.dotfiles/ollama/modelfile_gpt-oss-20b-ol gpt-oss-20b-ol
ollama rm gpt-oss:20b

# install opencode
curl -fsSL https://opencode.ai/install | bash
# NOTE: refresh opencode models and create it's files for faster startup
~/.opencode/bin/opencode models --refresh

# -- Clean up ---
# remove or invalidate cache data
sudo dnf clean all

# --- User config ---
# change shell to zsh
sudo chsh -s /usr/bin/zsh "$USER"

# replace shell with new one
exec zsh --login
