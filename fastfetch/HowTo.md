# How To

Generate ascii art using chafa:

```sh
chafa --size x23 \
--font-ratio 0.4 \
--colors full \
--fg-only \
--format symbols \
--symbols ascii \
catppuccin_logo.png > ~/.dotfiles/fastfetch/.config/fastfetch/ascii_art.txt
```

Where:

- font-ratio is (width / height) of terminal line
