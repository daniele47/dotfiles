setopt HIST_IGNORE_ALL_DUPS
setopt interactivecomments
setopt hist_verify
setopt auto_cd
HISTSIZE=10000
SAVEHIST=10000
WORDCHARS=${WORDCHARS//[\/&.;]/}
ZLE_REMOVE_SUFFIX_CHARS=$' \t\n;&|'
ZLE_SPACE_SUFFIX_CHARS=$';&|'

# completions
zstyle ':completion:*' menu no
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
autoload -U compinit
compinit -d "${XDG_STATE_HOME}/zsh_compdump"

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

# open command if xdg-open is available
if command -v xdg-open &>/dev/null; then
    function open() {
        (for arg in "$@"; do nohup xdg-open "$arg" &>/dev/null & done && :)
    }
fi
