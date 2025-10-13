#!/usr/bin/env bash

werb () {
    if test "${1}" == 'abort'; then
        unset -f 'werb'
    fi
    _werb="${1}" && shift 1
    case "${_werb}" in
        '') printf 'Here!\n';;
        help) cat "${werblyPath}/.foo/help.txt";;
        install|uninstall|init|deinit|show|man) . "${werblyPath}/.foo/${_werb}.sh";;
        define|undefine|apply|unapply|get) . "${werblyPath}/.foo/${_werb}.sh" "${@}";;
        *) printf 'Error: Unknown argument; Halting.\n' 1>&2;;
    esac
    unset -v '_werb'
}
