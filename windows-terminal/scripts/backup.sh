#!/bin/bash

# Check if the WINDOWS_USER_NAME environment variable is set
if [ -z "$WINDOWS_USER_NAME" ]; then
	echo "WINDOWS_USER_NAME is not set, use export WINDOWS_USER_NAME=<your_windows_user_name>"
	exit 1
fi

# Backup Windows Terminal settings to the dotfiles directory
cp /mnt/c/Users/$WINDOWS_USER_NAME/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState/settings.json ~/.dotfiles/windows-terminal/config/
