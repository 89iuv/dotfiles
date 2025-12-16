#!/bin/bash

mkdir -p "$(bat --config-dir)/themes"
cp ./bat/themes/Catppuccin* "$(bat --config-dir)/themes"
bat cache --build
