# Vscode

## Copy settings

```sh
WINDOWS_USER_NAME=<your_windows_user_name>
cp /mnt/c/Users/$WINDOWS_USER_NAME/AppData/Roaming/Code/User/settings.json ~/.dotfiles/vscode/
cp /mnt/c/Users/$WINDOWS_USER_NAME/AppData/Roaming/Code/User/keybindings.json ~/.dotfiles/vscode/
```

## Save extension

```sh
code --list-extensions > vscode/extensions.txt
```
