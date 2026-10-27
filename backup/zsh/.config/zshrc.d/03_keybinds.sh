bindkey '\e[1~' beginning-of-line             # Home
bindkey '\e[H' beginning-of-line              #
bindkey '\eOH' beginning-of-line              #
bindkey '\e[4~' end-of-line                   # End
bindkey '\e[F' end-of-line                    #
bindkey '\eOF' end-of-line                    #
bindkey '\e[3~' delete-char                   # Delete
bindkey '\e[2~' overwrite-mode                # Insert
bindkey "^K" kill-line                        # Ctrl+K
bindkey '^[[1;5D' backward-word               # Ctrl+Left
bindkey '^[[1;5C' forward-word                # Ctrl+Right
bindkey '^H' backward-kill-word               # Ctrl+Backspace
bindkey '^[[3;5~' kill-word                   # Ctrl+Delete
bindkey '^I' complete-word                    # Tab
autoload -U up-line-or-beginning-search       #
autoload -U down-line-or-beginning-search     #
zle -N up-line-or-beginning-search            #
zle -N down-line-or-beginning-search          #
bindkey '\e[5~' up-line-or-beginning-search   # Page up
bindkey '\e[6~' down-line-or-beginning-search # Page down
