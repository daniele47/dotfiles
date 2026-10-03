# initialize new system

- download autosaver, download this git repository, run `autosaver preset init`

```bash
# download autosaver
if ! [[ -f ~/.local/bin/autosaver ]]; then
    tmp=$(mktemp) &&
        curl -fsSL "https://raw.githubusercontent.com/daniele47/autosaver/refs/heads/main/install.sh" -o "$tmp" &&
        printf '%s  %s\n' "cb2ec2336ce7ec12eb2f1568ce62bacba9876590012b4fa163af1c00de038dab" "$tmp" | sha256sum -c &&
        bash "$tmp" ||
        echo -e '\e[1;31merror:\e[m Installation failed!\e[m'
fi

if [[ -f ~/.local/bin/autosaver ]]; then
    TMP_DIR="$(mktemp -d)" && 
        git clone https://codeberg.org/danix/dotfiles "$TMP_DIR" &&
        echo -n "Write what profile(s) to use: " &&
        read -r AUTOSAVER_PROFILE &&
        export AUTOSAVER_PROFILE &&
        ~/.local/bin/autosaver -y preset init
fi
```
