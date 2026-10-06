#!/bin/bash

# Check if the WINDOWS_USER_NAME environment variable is set
echo "Testing if the WINDOWS_USER_NAME environment variable is set..."
if [ -z "$WINDOWS_USER_NAME" ]; then
	echo "WINDOWS_USER_NAME is not set, use export WINDOWS_USER_NAME=<your_windows_user_name>"
	exit 1
fi

CONFIG_DIR=~/.dotfiles/vscode/config
USER_DIR=/mnt/c/Users/"$WINDOWS_USER_NAME"/AppData/Roaming/Code/User

mkdir -p "$USER_DIR"

# Restore VSCode settings
echo "Restoring VSCode settings..."
cp -f "$CONFIG_DIR/settings.json" "$USER_DIR/"

# Restore VSCode keybindings
echo "Restoring VSCode keybindings..."
cp -f "$CONFIG_DIR/keybindings.json" "$USER_DIR/"

# Restore VSCode extensions from the text file
echo "Restoring VSCode extensions..."
while IFS= read -r extension; do
	[ -z "$extension" ] && continue
	code --install-extension "$extension" --force
done < "$CONFIG_DIR/extensions.txt"

echo "Restore completed successfully."
