# How To

Generate ascii art using chafa:

```sh
chafa --size x22 \
--font-ratio 0.4 \
--colors full \
--fg-only \
--format symbols \
--symbols ascii \
image.png > ~/.dotfiles/fastfetch/.config/fastfetch/ascii_art.txt
```

Where:

- font-ratio is (width / height) of terminal line
