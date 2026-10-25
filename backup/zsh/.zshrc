### DISTRO SPECIFIC CUSTOMIZATIONS ###
case "$(grep -E '^ID=' /etc/os-release | cut -d= -f2- )" in
    kde-linux)
        if [[ -f '/usr/share/zsh/plugins/kde-linux-default/kde-linux-default-zshrc.zsh' ]]; then
            source '/usr/share/zsh/plugins/kde-linux-default/kde-linux-default-zshrc.zsh'
        fi
        ;;
esac

### ZSH CUSTOMIZATION ###
setopt HIST_IGNORE_ALL_DUPS
setopt interactivecomments
setopt hist_verify
setopt auto_cd
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
WORDCHARS=${WORDCHARS//[\/&.;]}
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
local path_segment='[%f%F{yellow}%n@%m%f:%F{cyan}%(4~|…/%3~|%~)%f]%f'
local git_segment='$(parse_git_info)'
local prompt_symbol='%(?. . %F{red}[%?]%f )%(#.#.$) '
PROMPT="${path_segment}${git_segment}${prompt_symbol}"

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
