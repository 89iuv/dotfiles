# Dotfiles

<!--toc:start-->

- [Dotfiles](#dotfiles)
  - [Local](#local)
    - [Setup System Environment](#setup-system-environment)
    - [Install Local Dotfiles](#install-local-dotfiles)
  - [Docker](#docker)
    - [Build Docker Image](#build-docker-image)
    - [Run With Docker](#run-with-docker)

<!--toc:end-->

## Local

### Setup System Environment

- Install Fedora in WSL: [Fedora WSL Documentation](https://docs.fedoraproject.org/en-US/cloud/wsl/)
- Install Nvidia Container Toolkit in Fedora: [Nvidia Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)
- Disable Windows Path in WSL: [Stack Overflow](https://stackoverflow.com/questions/51336147/how-to-remove-the-win10s-path-from-wsl/51345880#51345880)
- Install NerdFonts: [Nerdfonts Download](https://www.nerdfonts.com/font-downloads)
- Configure terminal colors: [Catppuccin Terminal Ports](https://catppuccin.com/ports/?q=terminal)

### Install Local Dotfiles

```sh
# clone repo and run install script
git clone --recurse-submodules https://github.com/89iuv/dotfiles.git ~/.dotfiles \
  && ~/.dotfiles/install.sh
```

## Docker

### Build Docker Image

```sh
docker build -t 89iuv/dotfiles .
```

### Run With Docker

```sh
docker run --rm -it \
  -e USER_UID=$(id -u) \
  -e USER_GID=$(id -g) \
  -e DOCKER_GID=$(getent group docker | cut -d: -f3) \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v "${HOME}"/.gitconfig:/home/dev/.gitconfig \
  -v "$(pwd)":/workspace \
  --hostname dark_vault \
  --name node_grid \
  --gpus all \
  --detach-keys="ctrl-z,z" \
  89iuv/dotfiles
```
