#!/bin/bash

mkdir -p "$(bat --config-dir)/themes"
ls
ls ./bat/
ls ./bat/themes/
cp ./bat/themes/Catppuccin* "$(bat --config-dir)/themes"
bat cache --build
