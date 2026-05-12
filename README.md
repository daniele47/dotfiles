# dotfiles

Personal dotfiles using my autosaver cli

## init script

```bash
# prompt for the profile to use
echo -n "What profile do you wish to install? "
read -r AUTOSAVER_PROFILE
export AUTOSAVER_PROFILE

# download git repo, and run
TMP_DIR="$(mktemp -d)"
git clone https://github.com/daniele47/dotfiles "$TMP_DIR" --depth=1
"$TMP_DIR/autosaver" run "$AUTOSAVER_PROFILE" -y
"$TMP_DIR/autosaver" restore "$AUTOSAVER_PROFILE" -ay
```
