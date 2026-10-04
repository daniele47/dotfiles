#!/bin/bash

# truncate to last 3 dirs
export PROMPT_DIRTRIM=3

function __cleanup_prompt__() {
    local -r retval="$?"

    # clear prompt line
    printf "\e[2K\r"

    # change PS1
    local -r red="\[\e[1;31m\]"
    local -r lgreen="\[\e[1;32m\]"
    local -r yellow="\[\e[1;33m\]"
    local -r purple="\[\e[1;35m\]"
    local -r green="\[\e[1;36m\]"
    local -r wipe="\[\e[0m\]"
    ###############################################
    local -r workdir="${green}\w "
    ###############################################
    local container_name=""
    container_name="$(sed -n 's/^name="\(.*\)"/\1/p' /run/.containerenv 2>/dev/null)"
    container_name="${container_name:-$container}"
    if [[ -n "$container_name" ]]; then container_name="${red}[$container_name]$wipe "; fi
    ###############################################
    local branch="" gitbranch_status="" gitstate=""
    local GITDIR="$PWD"
    until [[ -z "$GITDIR" || -e "$GITDIR/.git" ]]; do GITDIR="${GITDIR%/*}"; done
    if [[ -d "$GITDIR/.git" ]]; then
        read -r file <"$GITDIR/.git/HEAD"
        case "$file" in
        ref:*) branch="${file##*/}" ;;
        *) branch="${file:0:8}" ;;
        esac
        local -r gitbranch="${purple}(${branch})"
        local flags="" gitstatus=""
        [[ -n "$(git status --porcelain 2>/dev/null)" ]] && flags="*"
        [[ -n "$flags" ]] && local -r gitstatus="${red}${flags}"
        gitbranch_status="${gitbranch}${gitstatus} "
        ###############################################
        local state=""
        [[ -f "$GITDIR/.git/MERGE_HEAD" ]] && state="MERGING"
        [[ -f "$GITDIR/.git/CHERRY_PICK_HEAD" ]] && state="CHERRY-PICKING"
        [[ -f "$GITDIR/.git/REVERT_HEAD" ]] && state="REVERTING"
        [[ -f "$GITDIR/.git/BISECT_START" ]] && state="BISECTING"
        [[ -d "$GITDIR/.git/rebase-merge" ]] && state="REBASING"
        [[ -d "$GITDIR/.git/rebase-apply" ]] && {
            [[ -f "$GITDIR/.git/AM_HEAD" ]] && state="AM" || state="AM/REBASE"
        }
        [[ -f "$GITDIR/.git/REBASE_HEAD" ]] && state="REBASING"
        [[ -f "$GITDIR/.git/AM_HEAD" ]] && state="AM"
        [[ -n "$state" ]] && gitstate="${yellow}($state) "
    fi
    ###############################################
    local symbol=""
    case "$retval" in
    0) symbol="${lgreen}❯ " ;;
    *) symbol="${red}❯ " ;;
    esac
    ###############################################
    PS1="${wipe}${container_name}${workdir}${gitbranch_status}${gitstate}${symbol}${wipe}"

    # exit with correct status code
    return "${retval}"
}

# WARNING: DO NOT EXPORT VARIABLES WHEN APPENDING TO THEM -> ELEMENT APPENDED GETS APPENDED TWICE!
#   this is probably because they get appended once whilst logging into the current user, and once
#   when starting a bash process
PROMPT_COMMAND="__cleanup_prompt__;"${PROMPT_COMMAND}
