# Opencode

Config files are stored in `.config/opencode` and are copied (not symlinked) to
`~/.config/opencode`, because opencode does not work well with symlinks.

`secrets.txt` and `service.json` are not backed up.

## Backup Settings

Copy the config from `~/.config/opencode` to `.dotfiles`.

```sh
./scripts/backup.sh
```

## Restore Settings

Copy the config from `.dotfiles` to `~/.config/opencode`.

```sh
./scripts/restore.sh
```
