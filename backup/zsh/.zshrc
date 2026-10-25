### ZSH CUSTOMIZATION ###
setopt HIST_IGNORE_ALL_DUPS
setopt interactivecomments
setopt hist_verify
setopt auto_cd
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
WORDCHARS=${WORDCHARS//[\/&.;]/}
ZLE_REMOVE_SUFFIX_CHARS=$' \t\n;&|'
ZLE_SPACE_SUFFIX_CHARS=$';&|'

# completions
zstyle ':completion:*' menu no
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
autoload -U compinit
compinit

# prompt
autoload -U colors && colors
setopt PROMPT_SUBST
parse_git_info() {
    if git rev-parse --is-inside-work-tree &>/dev/null; then
        local branch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
        local git_status_indicator=""
        if [[ -n "$(git status --porcelain 2>/dev/null)" ]]; then
            git_status_indicator="%F{red}*%f"
        fi
        echo " (%f%F{blue}${branch}${git_status_indicator}%f)"
    fi
}
parse_container_info() {
    local name=""
    [[ -r /run/.containerenv ]] && name="$(sed -n 's/^name=//p' /run/.containerenv | tr -d '"')"
    [[ -z "$name" ]] && name="$container"
    [[ -n "$name" ]] && echo "[%F{magenta}${name}%f] "
}
local container_segment='$(parse_container_info)'
local path_segment='[%f%F{yellow}%n@%m%f:%F{cyan}%(4~|…/%3~|%~)%f]%f'
local git_segment='$(parse_git_info)'
local prompt_symbol='%(?. . %F{red}[%?]%f )%(#.#.$) '
PROMPT="${container_segment}${path_segment}${git_segment}${prompt_symbol}"

### KEYBINDS ###
bindkey '\e[1~' beginning-of-line
bindkey '\e[H' beginning-of-line
bindkey '\eOH' beginning-of-line
bindkey '\e[4~' end-of-line
bindkey '\e[F' end-of-line
bindkey '\eOF' end-of-line
bindkey '\e[3~' delete-char
bindkey '\e[2~' overwrite-mode
bindkey "^K" kill-line
bindkey '^[[1;5D' backward-word # Ctrl+Left
bindkey '^[[1;5C' forward-word  # Ctrl+Right
bindkey '^H' backward-kill-word # Ctrl+Backspace
bindkey '^[[3;5~' kill-word     # Ctrl+Delete
bindkey '^I' complete-word
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '\e[5~' up-line-or-beginning-search   # Page up
bindkey '\e[6~' down-line-or-beginning-search # Page down

### ALIASES ###
if type -p bat &>/dev/null; then
    alias cat="bat"
fi
if type -p lsd &>/dev/null; then
    alias ls="lsd --icon=never --group-dirs=last"
    alias tree='lsd --icon=never --group-directories-first --tree'
else
    alias ls="ls --color=auto"
    alias tree='tree -C'
fi
alias la="ls -A"
alias ll="ls -l"
alias lla="ls -lA"
alias grep="grep --color=auto"
if type -p distrobox &>/dev/null; then
    alias de='distrobox enter'
    alias dr='distrobox enter --'
    alias dl='distrobox list'
fi

### EXPORTS ###
export PATH="$HOME/.local/bin:$PATH"

# xdg base specification
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_BIN_HOME="${XDG_BIN_HOME:-$HOME/.local/bin}"
mkdir -p "$XDG_CONFIG_HOME" "$XDG_DATA_HOME" "$XDG_STATE_HOME" "$XDG_CACHE_HOME" "$XDG_BIN_HOME"

# fix pollution
export PYTHONPYCACHEPREFIX=/tmp/pycache-QwkkUVj3ROhgnrG1
export PYTHON_HISTORY="$XDG_STATE_HOME/python_history"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export GOPATH="$XDG_DATA_HOME/go"
export GOCACHE="$XDG_CACHE_HOME/go-build"
export NODE_REPL_HISTORY="$XDG_STATE_HOME/node_repl_history"
export SQLITE_HISTORY="$XDG_STATE_HOME/sqlite_history"
export HISTFILE="$XDG_STATE_HOME/bash_history"
export LESSHISTFILE="$XDG_STATE_HOME/less_history"
export WGETHISTFILE="$XDG_STATE_HOME/wget_history"

# set editor
if type -p nvim &>/dev/null; then
    export EDITOR=nvim
elif type -p vim &>/dev/null; then
    export EDITOR=vim
elif type -p vi &>/dev/null; then
    export EDITOR=vi
fi

### PLUGINS
for f in /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh \
    /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
    /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh; do
    [[ -f $f ]] && source $f
done
if (( $+functions[history-substring-search-up] )); then
    bindkey '^[[1;5A' history-substring-search-up   # Ctrl+↑
    bindkey '^[[1;5B' history-substring-search-down # Ctrl+↓
fi
