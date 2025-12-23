#!/bin/bash

nvim --headless \
  "+Lazy! sync" \
  "+lua require('blink.cmp').setup({})" \
  "+sleep 20" \
  "+MasonToolsInstallSync" \
  +qa

git reset --hard HEAD
nvim --headless "+Lazy! restore" +qa
