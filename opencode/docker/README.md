# Opencode

- [Opencode](#opencode)
  - [Build docker image](#build-docker-image)
  - [Run docker image](#run-docker-image)

## Build docker image

```sh
docker build -t opencode .
```

## Run docker image

Standard

```sh
docker run --rm -it \
-e USER_UID=$(id -u) \
-e USER_GID=$(id -g) \
-e ZCAT_LLM_KEY \
-v ~/.dotfiles/opencode/.config/opencode:/home/dev/.config/opencode \
-v $(pwd):/workspace \
opencode:latest

```

With git

```sh
docker run --rm -it \
-e USER_UID=$(id -u) \
-e USER_GID=$(id -g) \
-e ZCAT_LLM_KEY \
-v ~/.dotfiles/opencode/.config/opencode:/home/dev/.config/opencode \
-v ~/.ssh:/home/dev/.ssh \
-v ~/.gitconfig:/home/dev/.gitconfig \
-v $(pwd):/workspace \
opencode:latest
```
