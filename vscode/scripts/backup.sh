#!/bin/bash

# Check if the WINDOWS_USER_NAME environment variable is set
echo "Testing if the WINDOWS_USER_NAME environment variable is set..."
if [ -z "$WINDOWS_USER_NAME" ]; then
	echo "WINDOWS_USER_NAME is not set, use export WINDOWS_USER_NAME=<your_windows_user_name>"
	exit 1
fi

# Backup VSCode settings
echo "Backing up VSCode settings..."
cp /mnt/c/Users/"$WINDOWS_USER_NAME"/AppData/Roaming/Code/User/settings.json ~/.dotfiles/vscode/config/

# Backup VSCode keybindings
echo "Backing up VSCode keybindings..."
cp /mnt/c/Users/"$WINDOWS_USER_NAME"/AppData/Roaming/Code/User/keybindings.json ~/.dotfiles/vscode/config/

# Backup VSCode extensions to a text file
echo "Backing up VSCode extensions..."
code --list-extensions > ~/.dotfiles/vscode/config/extensions.txt

echo "Backup completed successfully."