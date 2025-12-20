#!/bin/bash

ROOT="$HOME"/.dotfiles/catppuccin-btop/

mkdir -p "$ROOT"/.config/btop/themes
cp "$ROOT"/btop/themes/*.theme "$ROOT"/.config/btop/themes
