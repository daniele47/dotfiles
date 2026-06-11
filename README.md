# dotfiles

Personal dotfiles using my autosaver cli

## install autosaver cli

```bash
curl -fsSL https://raw.githubusercontent.com/daniele47/autosaver/refs/heads/main/install.sh | bash -s
```

## install autosaver cli, run init scripts and restore dotfiles

```bash
# prompt for the profile to use
echo -n "What profile do you wish to install? "
read -r AUTOSAVER_PROFILE
export AUTOSAVER_PROFILE
export AUTOSAVER_ROOT="$(mktemp -d)"
export AUTOSAVER_HOME="$HOME"
export BIN_PATH="${XDG_BIN_HOME:-$HOME/.local/bin}/autosaver"

# install autosaver binary
curl -fsSL https://raw.githubusercontent.com/daniele47/autosaver/refs/heads/main/install.sh | bash -s

# download git repo, and run
git clone https://github.com/daniele47/dotfiles "$AUTOSAVER_ROOT" --depth=1
"$BIN_PATH" run "$AUTOSAVER_PROFILE" -y
"$BIN_PATH" restore "$AUTOSAVER_PROFILE" -ay
```

## TODO

- neovim updates:
    - improve statusline:
        - [ ] add `mode` to the statusline
        - [ ] it might not have enough `contrast` with everything else? maybe i need single statusline x thingy?
    - fix colorscheme
        - [ ] broken colorscheme on diagnostic floating windows
