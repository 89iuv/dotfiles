#!/bin/bash

git config --global core.pager delta

git config --global include.path "$HOME/.dotfiles/catppuccin-delta/delta/catppuccin.gitconfig"

git config --global interactive.diffFilter "delta --color-only"

git config --global delta.features catpuccin-mocha

git config --global delta.true-colors "always"
git config --global delta.navigate true
git config --global delta.line-numbers true

git config --global delta.commit-decoration-style "#9ca0b0 bold"
git config --global delta.file-style "#cdd6f4"
git config --global delta.file-decoration-style "#a6adc8 ul"

git config --global delta.hunk-header-style omit
git config --global delta.hunk-header-file-style "#9399b2"
git config --global delta.hunk-header-decoration-style "#7f849c box"

git config --global alias.diff-unified "-c delta.hunk-header-style=auto -c delta.line-numbers=false diff"
git config --global alias.diff-compare "-c delta.side-by-side=true diff"

git config --global diff.colorMoved default
git config --global merge.conflictstyle zdiff3

