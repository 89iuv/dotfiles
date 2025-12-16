#!/bin/bash

mkdir -p "$(bat --config-dir)/themes"

echo "debug: pwd"
pwd

echo "debug: ls"
ls

echo "debug: ls ./bat/"
ls ./bat/

echo "debug: ls ./bat/themes"
ls ./bat/themes/

cp ./bat/themes/Catppuccin* "$(bat --config-dir)/themes"
bat cache --build
