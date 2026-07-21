#!/bin/bash

# Check if the WINDOWS_USER_NAME environment variable is set
if [ -z "$WINDOWS_USER_NAME" ]; then
	echo "WINDOWS_USER_NAME is not set, use export WINDOWS_USER_NAME=<your_windows_user_name>"
	exit 1
fi

# Backup VSCode settings and keybindings to the dotfiles directory
cp /mnt/c/Users/"$WINDOWS_USER_NAME"/AppData/Roaming/Code/User/settings.json ~/.dotfiles/vscode/config/
cp /mnt/c/Users/"$WINDOWS_USER_NAME"/AppData/Roaming/Code/User/keybindings.json ~/.dotfiles/vscode/config/

# Backup VSCode extensions to a text file
code --list-extensions > ~/.dotfiles/vscode/config/extensions.txt