#!/usr/bin/env bash

werb () {
    if test "${1}" == 'abort'; then
        unset -f 'werb'
        printf 'Aborted!\n'
        return 0
    fi
    _werb="${1}" && shift 1
    case "${_werb}" in
        '')
            printf 'Here!\n';;
        help)
            cat "${werblyPath}/.foo/help.txt";;
        install|uninstall|init|deinit|show|man|exit)
            . "${werblyPath}/.foo/${_werb}.sh";;
        define|undefine|apply|unapply)
            . "${werblyPath}/.foo/${_werb}.sh" "${@}";;
        # for old/renamed commands (since initial release)
        uninit|list|fetch)
            . "${werblyPath}/.foo/_${_werb}.sh";;
        *)
            printf 'Error: Unknown argument; Halting.\n' 1>&2
            printf 'See `werb help` for known arguments.\n';;
    esac
    unset -v '_werb'
}
