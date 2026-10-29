# .bashrc

# User specific aliases and functions
if [ -d ~/.config/bashrc.d ]; then
    for rc in ~/.config/bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
