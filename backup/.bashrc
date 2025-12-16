# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific aliases and functions
BASHRC_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/bashrc.d"
if [ -d "$BASHRC_CONFIG_DIR" ]; then
    for rc in "$BASHRC_CONFIG_DIR/"*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc BASHRC_CONFIG_DIR
