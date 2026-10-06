#!/bin/bash

SRC_DIR="$HOME/.dotfiles/opencode/.config/opencode"
DEST_DIR="$HOME/.config/opencode"

FILES=(cli.json opencode.jsonc)

mkdir -p "$DEST_DIR"

# Copy instead of symlink, opencode does not work well with symlinks
echo "Restoring opencode config..."
for file in "${FILES[@]}"; do
	cp -f "$SRC_DIR/$file" "$DEST_DIR/$file" || exit 1
done

echo "Restore completed successfully."
