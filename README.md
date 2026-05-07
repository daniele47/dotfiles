# dotfiles

Personal dotfiles using my autosaver cli

## init scripts

### raspberry-pi

```bash
AUTOSAVER_PROFILE="raspy"

TMP_DIR="$(mktemp -d)"
git clone https://codeberg.org/danix/dotfiles "$TMP_DIR" --depth=1
"$TMP_DIR/autosaver" run "$AUTOSAVER_PROFILE" -y
"$TMP_DIR/autosaver" restore "$AUTOSAVER_PROFILE" -ya
```
