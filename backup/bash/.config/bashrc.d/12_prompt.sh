# truncate to last 3 dirs
export PROMPT_DIRTRIM=3

function __cleanup_prompt__() {
    local -r retval="$?"

    # clear prompt line
    printf "\e[2K\r"

    # change PS1
    local -r red="\[\e[31m\]"
    local -r lgreen="\[\e[32m\]"
    local -r yellow="\[\e[33m\]"
    local -r blue="\[\e[34m\]"
    local -r purple="\[\e[35m\]"
    local -r green="\[\e[36m\]"
    local -r wipe="\[\e[0m\]"
    ###############################################
    local -r path_segment="[${yellow}\u@\h${wipe}:${green}\w${wipe}] "
    ###############################################
    local container_segment=""
    container_segment="$(sed -n 's/^name="\(.*\)"/\1/p' /run/.containerenv 2>/dev/null)"
    container_segment="${container_segment:-$container}"
    if [[ -n "$container_segment" ]]; then container_segment="${purple}[$container_segment]$wipe "; fi
    ###############################################
    local git_segment=""
    if git rev-parse --is-inside-work-tree &>/dev/null; then
        local -r branch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
        local git_status_indicator=""
        if [[ -n "$(git status --porcelain 2>/dev/null)" ]]; then
            git_status_indicator="${red}*${wipe}"
        fi
        git_segment="(${blue}${branch}${git_status_indicator}${wipe}) "
    fi
    ###############################################
    local prompt_symbol="$ "
    if [[ "$retval" != 0 ]]; then prompt_symbol="${red}[$retval]${wipe} "; fi
    ###############################################
    PS1="${wipe}${container_segment}${path_segment}${git_segment}${prompt_symbol}${wipe}"

    # exit with correct status code
    return "${retval}"
}

# WARNING: DO NOT EXPORT VARIABLES WHEN APPENDING TO THEM -> ELEMENT APPENDED GETS APPENDED TWICE!
#   this is probably because they get appended once whilst logging into the current user, and once
#   when starting a bash process
PROMPT_COMMAND="__cleanup_prompt__;"${PROMPT_COMMAND}

# local path_segment='[%f%F{yellow}%n@%m%f:%F{cyan}%(4~|…/%3~|%~)%f]%f'
# local git_segment='$(parse_git_info)'
# local prompt_symbol='%(?. . %F{red}[%?]%f )%(#.#.%%) '
# PROMPT="${container_segment}${path_segment}${git_segment}${prompt_symbol}"
