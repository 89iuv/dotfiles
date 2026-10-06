#!/bin/bash

SRC_DIR="$HOME/.config/opencode"
DEST_DIR="$HOME/.dotfiles/opencode/.config/opencode"

# secrets.txt and service.json are intentionally not backed up
FILES=(cli.json opencode.jsonc)

mkdir -p "$DEST_DIR"

echo "Backing up opencode config..."
for file in "${FILES[@]}"; do
	cp -f "$SRC_DIR/$file" "$DEST_DIR/$file" || exit 1
done

echo "Backup completed successfully."
