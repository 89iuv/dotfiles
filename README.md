# Dotfiles

<!-- markdownlint-disable MD013 -->

<!--toc:start-->
- [Dotfiles](#dotfiles)
  - [Setup System Environment](#setup-system-environment)
  - [Install Local Dotfiles](#install-local-dotfiles)
  - [Run With Docker](#run-with-docker)
<!--toc:end-->

## Setup System Environment

- Install Fedora in WSL: [Fedora WSL Documentation](https://docs.fedoraproject.org/en-US/cloud/wsl/)
- Install NerdFonts: [Nerdfonts Download](https://www.nerdfonts.com/font-downloads)
- Configure terminal colors: [Catppuccin Terminal Ports](https://catppuccin.com/ports/?q=terminal)
- Install Nvidia Container Toolkit: [Nvidia Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)

## Install Local Dotfiles

```sh
# clone repo and run install script
git clone --recurse-submodules https://github.com/89iuv/dotfiles.git ~/.dotfiles \
  && ~/.dotfiles/install.sh
```

## Run With Docker

```sh
docker run --rm -it \
  -e USER_UID=$(id -u) \
  -e USER_GID=$(id -g) \
  -e DOCKER_GID=$(getent group docker | cut -d: -f3) \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $(pwd):/workspace \
  -h container \
  --name dev_container \
  --detach-keys="ctrl-z,z" \
  89iuv/dotfiles
```
