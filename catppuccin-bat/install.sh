#!/bin/bash

mkdir -p "$(bat --config-dir)/themes"
cp ./themes/catppuccin* ~/.config/bat/themes
bat cache --build
