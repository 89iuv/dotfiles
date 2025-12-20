#!/bin/bash

ROOT="$HOME"/.dotfiles/catppuccin-zsh-syntax-highlighting/

mkdir -p "$ROOT"/.oh-my-zsh/custom/helpers/zsh-syntax-highlighting/themes/
cp "$ROOT"/./zsh-syntax-highlighting/themes/*.zsh \
  "$ROOT"/.oh-my-zsh/custom/helpers/zsh-syntax-highlighting/themes/
