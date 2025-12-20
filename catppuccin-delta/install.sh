#!/bin/bash

git config --global core.pager delta

git config --global include.path "$HOME/.config/delta/themes/catppuccin.gitconfig"

git config --global interactive.diffFilter "delta --color-only"

git config --global delta.features catppuccin-macchiato

git config --global delta.true-colors "always"
git config --global delta.navigate true
git config --global delta.line-numbers true

git config --global delta.commit-decoration-style "bold"
git config --global delta.file-decoration-style "ul"

git config --global delta.hunk-header-style omit
git config --global delta.hunk-header-decoration-style "box"

git config --global alias.diff-unified "-c delta.hunk-header-style=auto -c delta.line-numbers=false diff"
git config --global alias.diff-compare "-c delta.side-by-side=true diff"

git config --global diff.colorMoved default
git config --global merge.conflictstyle zdiff3

