#!/usr/bin/env bash
#
# termtest.sh - Test terminal text rendering capabilities.
#
# Focus: true color, underline styles (single, double, curly, dotted, dashed),
# underline colors. Also covers common text attributes, 256 colors,
# hyperlinks, and Unicode/glyph rendering.
#
# Usage:  ./termtest.sh
#         ./termtest.sh --section underline ulcolor
#         ./termtest.sh --list
#
# Works with bash 3.2+ (including stock macOS bash).

RST=$'\e[0m'
SECTIONS=(info attrs 16 256 truecolor underline ulcolor matrix diagnostics overline links unicode)

trap 'printf "\e[0m"' EXIT

# --------------------------------------------------------------------------
# Helpers
# --------------------------------------------------------------------------

# sgr 1 3 '4:3' '58;2;255;0;0'  ->  ESC[1;3;4:3;58;2;255;0;0m
sgr() {
  local IFS=';'
  printf '\e[%sm' "$*"
}

header() {
  printf '\n%s%s== %s ==%s\n' "$(sgr 1)" "$(sgr 38 2 120 200 255)" "$1" "$RST"
}

# Convert HSV (h: 0-1535, s: 0-255, v: 0-255) to R G B globals.
hsv() {
  local h=$1 s=$2 v=$3
  local region=$((h / 256)) f=$((h % 256))
  local p=$((v * (255 - s) / 255))
  local q=$((v * (255 - s * f / 255) / 255))
  local t=$((v * (255 - s * (255 - f) / 255) / 255))
  case $region in
  0)
    R=$v
    G=$t
    B=$p
    ;;
  1)
    R=$q
    G=$v
    B=$p
    ;;
  2)
    R=$p
    G=$v
    B=$t
    ;;
  3)
    R=$p
    G=$q
    B=$v
    ;;
  4)
    R=$t
    G=$p
    B=$v
    ;;
  *)
    R=$v
    G=$p
    B=$q
    ;;
  esac
}

term_width() {
  local cols
  cols=$(tput cols 2>/dev/null || echo 80)
  local w=$((cols - 4))
  ((w > 76)) && w=76
  ((w < 20)) && w=20
  echo "$w"
}

# --------------------------------------------------------------------------
# Sections
# --------------------------------------------------------------------------

sec_info() {
  header "Environment"
  local var
  for var in TERM COLORTERM TERM_PROGRAM TERM_PROGRAM_VERSION VTE_VERSION \
    KITTY_WINDOW_ID WT_SESSION TMUX STY NO_COLOR LANG LC_ALL; do
    if [[ -n ${!var+x} ]]; then
      printf '  %-22s %s\n' "$var" "${!var}"
    fi
  done

  case "${COLORTERM:-}" in
  truecolor | 24bit)
    echo "  -> COLORTERM advertises true color support"
    ;;
  *)
    echo "  -> COLORTERM does not advertise true color"
    echo "     (may still work; check the gradients below)"
    ;;
  esac

  if command -v tput >/dev/null 2>&1; then
    printf '  %-22s %sx%s\n' "Size" "$(tput cols 2>/dev/null)" "$(tput lines 2>/dev/null)"
    printf '  %-22s %s\n' "tput colors" "$(tput colors 2>/dev/null)"
  fi

  if [[ -n ${TMUX:-} ]]; then
    echo "  NOTE: inside tmux. For curly underlines / true color you need e.g.:"
    printf '    %s\n' \
      "set -g default-terminal 'tmux-256color'" \
      "set -as terminal-features ',*:RGB'" \
      "set -as terminal-overrides ',*:Smulx=\\E[4::%p1%dm'" \
      "set -as terminal-overrides ',*:Setulc=\\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'"
  fi
}

sec_attrs() {
  header "Basic text attributes"
  local entry name on off
  local attrs=(
    "Bold|1|22"
    "Dim / faint|2|22"
    "Italic|3|23"
    "Underline (single)|4|24"
    "Blink (slow)|5|25"
    "Blink (rapid)|6|25"
    "Reverse video|7|27"
    "Hidden (invisible ->)|8|28"
    "Strikethrough|9|29"
    "Double underline (21)|21|24"
    "Overline (53)|53|55"
  )
  for entry in "${attrs[@]}"; do
    IFS='|' read -r name on off <<<"$entry"
    printf '  %-26s%sThe quick brown fox jumps%s <- end\n' \
      "$name" "$(sgr "$on")" "$(sgr "$off")"
  done
  printf '  %-26s%sbold italic underline strike%s\n' \
    "Combined" "$(sgr 1 3 4 9)" "$RST"
}

sec_16() {
  header "16 ANSI colors"
  local i code fg="  fg: " bg="  bg: "
  for i in $(seq 0 15); do
    if ((i < 8)); then code=$((30 + i)); else code=$((90 + i - 8)); fi
    fg+=$(printf '%s%3d%s ' "$(sgr $code)" "$i" "$RST")
    if ((i < 8)); then code=$((40 + i)); else code=$((100 + i - 8)); fi
    bg+=$(printf '%s%3d%s ' "$(sgr $code)" "$i" "$RST")
  done
  echo "$fg"
  echo "$bg"
}

sec_256() {
  header "256-color palette"
  local n
  # System colors
  printf '  '
  for ((n = 0; n < 16; n++)); do printf '\e[48;5;%dm  ' "$n"; done
  printf '%s\n' "$RST"
  # 6x6x6 cube
  for ((row = 0; row < 6; row++)); do
    printf '  '
    for ((n = 16 + row * 36; n < 16 + (row + 1) * 36; n++)); do
      printf '\e[48;5;%dm  ' "$n"
    done
    printf '%s\n' "$RST"
  done
  # Grayscale
  printf '  '
  for ((n = 232; n < 256; n++)); do printf '\e[48;5;%dm  ' "$n"; done
  printf '%s\n' "$RST"
}

sec_truecolor() {
  header "True color (24-bit)"
  local width x y t r g b
  width=$(term_width)

  ramp() {
    local name=$1 channel=$2
    printf '  '
    for ((x = 0; x < width; x++)); do
      t=$((x * 255 / (width - 1)))
      case $channel in
      r)
        r=$t
        g=0
        b=0
        ;;
      g)
        r=0
        g=$t
        b=0
        ;;
      b)
        r=0
        g=0
        b=$t
        ;;
      w)
        r=$t
        g=$t
        b=$t
        ;;
      h)
        hsv $((x * 1535 / (width - 1))) 255 255
        r=$R
        g=$G
        b=$B
        ;;
      esac
      printf '\e[48;2;%d;%d;%dm ' "$r" "$g" "$b"
    done
    printf '%s %s\n' "$RST" "$name"
  }
  ramp red r
  ramp green g
  ramp blue b
  ramp gray w
  ramp hue h

  echo
  echo "  2D gradient (half blocks, 2 colors per cell):"
  local rows=8 s_top s_bot h tr tg tb br bg bb
  for ((y = 0; y < rows; y++)); do
    printf '  '
    s_top=$((255 - 255 * (2 * y) / (2 * rows)))
    s_bot=$((255 - 255 * (2 * y + 1) / (2 * rows)))
    for ((x = 0; x < width; x++)); do
      h=$((x * 1535 / (width - 1)))
      hsv "$h" "$s_top" 255
      tr=$R
      tg=$G
      tb=$B
      hsv "$h" "$s_bot" 255
      br=$R
      bg=$G
      bb=$B
      printf '\e[38;2;%d;%d;%dm\e[48;2;%d;%d;%dm▀' "$tr" "$tg" "$tb" "$br" "$bg" "$bb"
    done
    printf '%s\n' "$RST"
  done

  echo
  printf '  Foreground true color text: %sorange%s %spurple%s %steal%s\n' \
    "$(sgr 38 2 255 100 0)" "$RST" "$(sgr 38 2 180 90 255)" "$RST" \
    "$(sgr 38 2 0 220 160)" "$RST"
  printf '  Colon syntax (38:2::r:g:b): %sorange%s %spurple%s %steal%s\n' \
    "$(sgr 38:2::255:100:0)" "$RST" "$(sgr 38:2::180:90:255)" "$RST" \
    "$(sgr 38:2::0:220:160)" "$RST"
  echo "  (If the gradients show visible banding or only ~6 steps per channel,"
  echo "   the terminal is quantizing to 256 colors.)"
}

sec_underline() {
  header "Underline styles  (SGR 4:x)"
  local text="The quick brown fox jumps over the lazy dog"
  local entry name code
  local styles=(
    "none|4:0" "single|4:1" "double|4:2"
    "curly / wavy|4:3" "dotted|4:4" "dashed|4:5"
  )
  for entry in "${styles[@]}"; do
    IFS='|' read -r name code <<<"$entry"
    printf '  %-26s%s%s%s\n' "$name ($code)" "$(sgr "$code")" "$text" "$RST"
  done

  echo
  echo "  Legacy fallbacks:"
  printf '  %-26s%s%s%s\n' "single (SGR 4)" "$(sgr 4)" "$text" "$RST"
  printf '  %-26s%s%s%s\n' "double (SGR 21)" "$(sgr 21)" "$text" "$RST"

  echo
  echo "  Tip: look at descenders (g, j, p, q, y). Underline should not be"
  echo "  clipped, and curly should be a smooth wave, not a straight line."

  header "Underline styles on repeated chars (easier to see the pattern)"
  local spaces="                                        "
  local letters="abcdefghijabcdefghijabcdefghijabcdefghij"
  for entry in "${styles[@]:1}"; do
    IFS='|' read -r name code <<<"$entry"
    printf '  %-26s%s%s%s|\n' "$name" "$(sgr "$code")" "$spaces" "$RST"
    printf '  %-26s%s%s%s|\n' "$name (text)" "$(sgr "$code")" "$letters" "$RST"
  done
}

sec_ulcolor() {
  header "Underline colors  (SGR 58 / 59)"
  local text="Colored underline"
  local entry name r g b

  local colors=(
    "red|255|60|60" "green|60|220|90" "blue|80|140|255" "orange|255|160|0"
  )

  echo "  Semicolon form  58;2;r;g;b"
  for entry in "${colors[@]}"; do
    IFS='|' read -r name r g b <<<"$entry"
    printf '    %-10s%s%s%s%s\n' "$name" "$(sgr 4)" "$(sgr 58 2 "$r" "$g" "$b")" "$text" "$RST"
  done

  echo
  echo "  Colon form      58:2::r:g:b  (preferred by kitty, WezTerm, foot, ...)"
  for entry in "${colors[@]}"; do
    IFS='|' read -r name r g b <<<"$entry"
    printf '    %-10s%s%s%s%s\n' "$name" "$(sgr 4)" "$(sgr "58:2::$r:$g:$b")" "$text" "$RST"
  done

  echo
  echo "  Indexed color   58:5:n"
  local n
  for n in 1 2 4 208 213; do
    printf '    %-10s%s%s%s%s\n' "index $n" "$(sgr 4)" "$(sgr "58:5:$n")" "$text" "$RST"
  done

  echo
  echo "  Underline color differs from text color:"
  printf '    %s%s%swhite text, red curly underline%s\n' \
    "$(sgr 38 2 255 255 255)" "$(sgr 4:3)" "$(sgr 58 2 255 0 0)" "$RST"
  printf '    %s%s%syellow text, blue dashed underline%s\n' \
    "$(sgr 38 2 255 220 0)" "$(sgr 4:5)" "$(sgr 58 2 0 180 255)" "$RST"

  echo
  echo "  Reset underline color only (SGR 59):"
  printf '    %s%sred underline %sback to default%s\n' \
    "$(sgr 4)" "$(sgr 58 2 255 0 0)" "$(sgr 59)" "$RST"
}

sec_matrix() {
  header "Style x color matrix"
  local styles=("single|4:1" "double|4:2" "curly|4:3" "dotted|4:4" "dashed|4:5")
  local colors=("red|255|70|70" "green|70|220|100" "blue|90|150|255"
    "yellow|255|210|60" "magenta|230|90|230")
  local s c sname scode cname r g b line

  line="  $(printf '%-8s' '')"
  for c in "${colors[@]}"; do
    IFS='|' read -r cname r g b <<<"$c"
    line+=$(printf '%-10s' "$cname")
  done
  echo "$line"

  for s in "${styles[@]}"; do
    IFS='|' read -r sname scode <<<"$s"
    line="  $(printf '%-8s' "$sname")"
    for c in "${colors[@]}"; do
      IFS='|' read -r cname r g b <<<"$c"
      line+="$(sgr "$scode")$(sgr 58 2 "$r" "$g" "$b")sample${RST}    "
    done
    echo "$line"
  done
}

sec_diagnostics() {
  header "Editor-style diagnostics (typical LSP use case)"
  printf '  let x = %s%s%s + 1;      <- error (red curly)\n' \
    "$(sgr 4:3 58 2 255 70 70)" "undefined_var" "$RST"
  printf '  let y = %s%s%s;            <- warning (yellow curly)\n' \
    "$(sgr 4:3 58 2 255 190 0)" "unused_value" "$RST"
  printf '  let z = %s%s%s;               <- info (blue curly)\n' \
    "$(sgr 4:3 58 2 90 170 255)" "some_info" "$RST"
  printf '  let w = %s%s%s;              <- hint (gray dotted)\n' \
    "$(sgr 4:4 58 2 140 140 140)" "maybe_hint" "$RST"
  printf '  let v = %s%s%s;               <- spelling (green dashed)\n' \
    "$(sgr 4:5 58 2 0 200 120)" "spell_chek" "$RST"
}

sec_overline() {
  header "Overline / strikethrough combos"
  printf '  %soverline%s   %sstrike%s   %soverline + curly underline + color%s\n' \
    "$(sgr 53)" "$RST" "$(sgr 9)" "$RST" \
    "$(sgr 53 4:3 58 2 255 80 80)" "$RST"
  printf '  %sstrike + double underline%s\n' "$(sgr 9 4:2)" "$RST"
}

sec_links() {
  header "Hyperlinks (OSC 8)"
  local url="https://example.com"
  printf '  \e]8;;%s\e\\Clickable link to example.com\e]8;;\e\\  (hover / ctrl-click)\n' "$url"
}

sec_unicode() {
  header "Unicode / glyph rendering"
  echo "  Box drawing : ┌──┬──┐ ╔══╦══╗ ╭──╮"
  echo "                │  │  │ ║  ║  ║ ╰──╯"
  echo "  Blocks      : █▓▒░ ▁▂▃▄▅▆▇█ ▀▄▌▐"
  echo "  Braille     : ⠁⠃⠇⠏⠟⠿⡿⣿"
  printf '  Powerline   : \xee\x82\xb0 \xee\x82\xb1 \xee\x82\xb2 \xee\x82\xb3 \xee\x82\xb4 \xee\x82\xb6 \xee\x82\xa0  (needs patched font)\n'
  echo "  Arrows/math : ←↑→↓ ⇒ ∀∃∈ ∞ ≠ ≤ ≥ √"
  echo "  Wide (CJK)  : 日本語 中文 한국어  (each char should take 2 cells)"
  printf '  Emoji       : \xf0\x9f\x98\x80 \xf0\x9f\x9a\x80 \xf0\x9f\x8c\x88 \xf0\x9f\x91\xa8\xe2\x80\x8d\xf0\x9f\x92\xbb \xf0\x9f\x87\xaa\xf0\x9f\x87\xba \xe2\x9d\xa4\xef\xb8\x8f\n'
  printf '  Combining   : e\xcc\x81 a\xcc\x88 n\xcc\x83 o\xcc\x82  (accent should sit on letter)\n'
  echo "  Ligatures   : -> => == != === <= >= :: <|> (font dependent)"
  echo "  Alignment   : |日|ab|🚀|x|  <- columns should line up with next line"
  echo "                |  |ab|  |x|"
}

# --------------------------------------------------------------------------
# Main
# --------------------------------------------------------------------------

usage() {
  cat <<EOF
Usage: ${0##*/} [--list] [--section NAME...]

Sections: ${SECTIONS[*]}
EOF
}

valid_section() {
  local s
  for s in "${SECTIONS[@]}"; do [[ $s == "$1" ]] && return 0; done
  return 1
}

main() {
  local names=()
  case "${1:-}" in
  -h | --help)
    usage
    return 0
    ;;
  --list)
    echo "Sections: ${SECTIONS[*]}"
    return 0
    ;;
  --section)
    shift
    if (($# == 0)); then
      usage >&2
      return 1
    fi
    local n
    for n in "$@"; do
      if ! valid_section "$n"; then
        echo "Unknown section: $n" >&2
        usage >&2
        return 1
      fi
    done
    names=("$@")
    ;;
  "") names=("${SECTIONS[@]}") ;;
  *)
    usage >&2
    return 1
    ;;
  esac

  local n
  for n in "${names[@]}"; do "sec_$n"; done
  echo
}

main "$@"
