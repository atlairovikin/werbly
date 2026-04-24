#!/usr/bin/env bash

werb () {
    if [ "$1" == 'abort' ]; then
        unset -f 'werb'
        printf 'Aborted!\n'
        return 0
    fi
    [ -n "${werblyPath+set}" ] || export 'werblyPath'="${HOME}/werbly"
    _werb="$1" && shift 1
    case "$_werb" in
        '')
            printf 'Here!\n';;
        'help')
            cat "${werblyPath}/.foo/help.txt";;
        'install'|'uninstall'|'init'|'deinit'|'show'|'man'|'exit')
            . "${werblyPath}/.foo/${_werb}.sh";;
        'define'|'undefine'|'apply'|'unapply'|'perm-define-all')
            . "${werblyPath}/.foo/${_werb}.sh" "$@";;
        # for renamed/removed commands (since initial release)
        'uninit'|'list'|'fetch'|'get')
            . "${werblyPath}/.foo/_${_werb}.sh";;
        *)
            printf 'Error: Unknown argument; Halting.\n' >&2
            printf 'See `werb help` for known arguments.\n';;
    esac
    unset -v '_werb'
}
