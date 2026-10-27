# open command if xdg-open is available
if command -v xdg-open &>/dev/null; then
    function open() {
        (for arg in "$@"; do nohup xdg-open "$arg" &>/dev/null & done && :)
    }
fi

# set editor
if command -v /bin/vim &>/dev/null; then
    export EDITOR=vim
elif command -v /bin/nvim &>/dev/null; then
    export EDITOR=nvim
    alias vim='nvim'
elif command -v /bin/vi &>/dev/null; then
    export EDITOR=vi
    alias vim='vi'
fi
