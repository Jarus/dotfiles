#!/usr/bin/env zsh

_terminal_update_title() {
    local title

    if [[ ! -z $SSH_CONNECTION ]]; then
        title="${(%):-(%m) %~}"
    else
        title="${(%):-%~}"
    fi
    print -n $'\e]0;'${title}'\a'
}

_terminal_preexec_handler() {
    local title

    if [[ ! -z $SSH_CONNECTION ]]; then
        title="${(%):-(%m) ● $2}"
    else
        title="${(%):-● $2}"
    fi
    print -n $'\e]0;'${title}'\a'
}

add-zsh-hook precmd _terminal_update_title
add-zsh-hook preexec _terminal_preexec_handler
