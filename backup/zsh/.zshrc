# .zshrc

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions
if [[ -d ~/.config/zshrc.d ]]; then
    for rc in ~/.config/zshrc.d/*(N); do
        if [[ -f "$rc" ]]; then
            . "$rc"
        fi
    done
fi
unset rc
