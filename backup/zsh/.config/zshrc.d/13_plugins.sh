for f in /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh \
    /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
    /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh; do
    [[ -f $f ]] && source $f
done
if (($ + functions[history - substring - search - up])); then
    bindkey '^[[1;5A' history-substring-search-up   # Ctrl+↑
    bindkey '^[[1;5B' history-substring-search-down # Ctrl+↓
fi


