# dotfiles

Personal dotfiles using my autosaver cli

## init script

```bash
# prompt for the profile to use
echo -n "What profile do you wish to install? "
read -r AUTOSAVER_PROFILE
export AUTOSAVER_PROFILE
export AUTOSAVER_ROOT="$(mktemp -d)"

# install autosaver binary
export BIN_PATH=""
BIN_PATH="${XDG_BIN_HOME:-$HOME/.local/bin}/autosaver"
curl -fsSL https://raw.githubusercontent.com/daniele47/autosaver/refs/heads/main/install.sh | bash -s

# download git repo, and run
git clone https://github.com/daniele47/dotfiles "$AUTOSAVER_ROOT" --depth=1
"$BIN_PATH" run "$AUTOSAVER_PROFILE" -y
"$BIN_PATH" restore "$AUTOSAVER_PROFILE" -ay
```
