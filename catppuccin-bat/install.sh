#!/bin/bash

mkdir -p "$(bat --config-dir)/themes"
cp "${HOME}"/.dotfiles/catppuccin-bat/bat/themes/Catppuccin* "$(bat --config-dir)/themes"
bat cache --build
