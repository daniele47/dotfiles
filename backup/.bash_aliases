#!/bin/bash

export EDITOR=nvim
alias la="ls -A"
alias ll="ls -l"
alias lla="ls -lA


# prompt
function __cleanup_prompt__() {
    \builtin local -r retval="$?"

    # change PS1
    \builtin local -r red="\[\e[1;31m\]"
    \builtin local -r lgreen="\[\e[1;32m\]"
    \builtin local -r yellow="\[\e[1;33m\]"
    \builtin local -r lblue="\[\e[1;34m\]"
    \builtin local -r purple="\[\e[1;35m\]"
    \builtin local -r green="\[\e[1;36m\]"
    \builtin local -r wipe="\[\e[0m\]"
    ###############################################
    \builtin local -r workdir="${green}\w "
    ###############################################
    \builtin local -r podman="${red}[ raspberrypi] "
    ###############################################
    \builtin local status=
    [[ "$retval" -ne 0 ]] && status="${red}❌${retval} "
    ###############################################
    \builtin local symbol=""
    case "$retval" in
    0) symbol="${lgreen}❯ " ;;
    *) symbol="${red}❯ " ;;
    esac
    ###############################################
    PS1="${wipe}${podman}${workdir}${status}${symbol}${wipe}"

    # exit with correct status code
    return "${retval}"
}
PROMPT_COMMAND="__cleanup_prompt__;"${PROMPT_COMMAND}


